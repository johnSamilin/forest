import React, { memo, useRef, useEffect } from 'react';
import { useThree, useFrame } from 'react-three-fiber';
import * as THREE from 'three';
import { PerspectiveCamera } from 'drei';

export const Controls = memo(({ position, target }) => {
  const orbitRef = useRef();
  const { camera, gl } = useThree();

  useEffect(() => {
    camera.lookAt(target);
    orbitRef.current && orbitRef.current.target.copy(new THREE.Vector3(...target));
  }, [position, target, orbitRef, camera]);

  useFrame(() => {
    orbitRef.current.update();
  });

  return (
    <orbitControls
      maxPolarAngle={Math.PI / 3}
      minPolarAngle={Math.PI / 3}
      args={[camera, gl.domElement]}
      ref={orbitRef}
    />
  )
});

export const Camera = ({ position }) => {
  return (
    <PerspectiveCamera makeDefault position={position} fov={15} />
  );
}
