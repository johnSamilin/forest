import React, { memo, Suspense, useState, useMemo, useEffect, useRef } from 'react';
import * as THREE from 'three';
import useFrameWorker from './utils/useFrame.worker';

const worker = new useFrameWorker();
const { Vector3, CatmullRomCurve3 } = THREE;

export const Character = memo((props) => {
  const { position, isWalking, path, onStopMoving, onMove, speed = 0.95, Model } = props;
  const [characterRoot, setCharacterRoot] = useState();
  const animationProgress = useRef(0);

  /**
   * Кривая, повторяющая путь; для определения нужного угла поворота модели игрока
   */
  const v = new Vector3();
  const pathSpline = useMemo(() => {
    animationProgress.current = 0;
    return new CatmullRomCurve3(
      path
        ? path.map(point => new Vector3(point[1] * 2, 0, point[0] * 2))
        : [],
      false,
      'catmullrom'
    );

  }, [path]);

  useEffect(() => {
    worker.postMessage({ useFrame: { enabled: isWalking } });

    return () => worker.postMessage({ useFrame: { enabled: false } });
  }, [isWalking]);

  const delta = useMemo(() => {
    if (path) {
      return (0.01  / path.length) * speed;
    }
    return 0;
  }, [path, speed]);
  worker.onmessage = () => {
    if (path) {
      animationProgress.current = animationProgress.current + delta;
      // поворот модели
      const lookAtPoint = animationProgress.current;
      pathSpline.getPoint(lookAtPoint, v);
      characterRoot.lookAt(v);
      // перемещение модели
      characterRoot.position.set(v.x, v.y, v.z);
      // уведомляем родительский компонент
      onMove(v.x, v.y, v.z);
      if (animationProgress.current >= 1 - delta) { // because pathSpline.getPoint(1.01) === pathSpline.getPoint(0.01)        
        const lastPoint = path[path.length - 1];
        const lastPointVec = new Vector3(lastPoint[1] * 2, 0, lastPoint[0] * 2)
        onStopMoving(lastPointVec.x, lastPointVec.y, lastPointVec.z);
        animationProgress.current = 0;
      }
    }
  };

  return (<Suspense fallback={<></>}>
    <group ref={setCharacterRoot} position={position} up={[0, 1, 0]}>
      <Model isWalking={isWalking} speed={speed} />
    </group>
  </Suspense>);
});
