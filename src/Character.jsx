import React, { memo, Suspense, useState, useMemo, useEffect, useRef, useContext } from 'react';
import * as THREE from 'three';
import useFrameWorker from './utils/useFrame.worker';
import { NPC } from './models/NPC';
import { Context } from './context';
import { movePlayer, setPlayerPosition } from './reducers/players';

const { Vector3, CatmullRomCurve3 } = THREE;

export const Character = memo((props) => {
  const { position, isSelected = false, speed = 1.5, model, id, onClick } = props;
  const [characterRoot, setCharacterRoot] = useState();
  const [isHovered, setIsHovered] = useState(false);
  const animationProgress = useRef(0);
  const { playersState, dispatch } = useContext(Context);
  const path = playersState.movement[id];
  const isWalking = useMemo(() => path !== null, [path]);

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

  const delta = useMemo(() => {
    if (path) {
      return (0.01  / path.length) * speed;
    }
    return 0;
  }, [path, speed]);
  function onStopMoving(x, y, z) {
    dispatch(setPlayerPosition(id, [x, y, z]));
    dispatch(movePlayer(id, null));
  }
  function handleAnimationTick() {
    if (path) {
      animationProgress.current = animationProgress.current + delta;
      // поворот модели
      const lookAtPoint = animationProgress.current;
      pathSpline.getPoint(lookAtPoint, v);
      characterRoot.lookAt(v);
      // перемещение модели
      characterRoot.position.set(v.x, v.y, v.z);
      if (animationProgress.current >= 1 - delta) { // because pathSpline.getPoint(1.01) === pathSpline.getPoint(0.01)
        const lastPoint = path[path.length - 1];
        const lastPointVec = new Vector3(lastPoint[1] * 2, 0, lastPoint[0] * 2)
        onStopMoving(lastPointVec.x, lastPointVec.y, lastPointVec.z);
        animationProgress.current = 0;
      }
    }
  }
  const worker = useMemo(() => new useFrameWorker(), [id]);
  worker.onmessage = handleAnimationTick;
  useEffect(() => {
    worker.postMessage({ useFrame: { enabled: isWalking } });

    return () => worker.postMessage({ useFrame: { enabled: false } });
  }, [isWalking]);

  const handlePointerUp = (e) => onClick(e, id);
  function handlePointerDown(e) {
    e.stopPropagation();
  }
  function handlePointerOver(e) {
    e.stopPropagation();
    setIsHovered(true);
  }
  function handlePointerOut(e) {
    e.stopPropagation();
    setIsHovered(false);
  }
  return (<Suspense fallback={<></>}>
    <group
      ref={setCharacterRoot}
      position={position}
      up={[0, 1, 0]}
      onPointerUp={handlePointerUp}
      onPointerDown={handlePointerDown}
      onPointerOver={handlePointerOver}
      onPointerOut={handlePointerOut}
    >
      <mesh visible={isSelected || isHovered} position={[0, -0.5, 0]} receiveShadow castShadow>
        <cylinderGeometry attach="geometry" args={[0.5, 0.5, 0.1, 30, 1, isHovered && !isSelected]} />
        <meshPhysicalMaterial attach="material" />
      </mesh>
      {isSelected && 
      <spotLight
        position={[0, 3, 0]}
        penumbra={1}
        decay={1}
        castShadow
        angle={Math.PI}
        distance={50}
      />}
      <NPC model={model} isWalking={isWalking} speed={speed} id={id} />
    </group>
  </Suspense>);
});
