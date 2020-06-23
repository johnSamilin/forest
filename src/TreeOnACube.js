import React, { useRef, Suspense } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend, useThree, useFrame } from 'react-three-fiber'
import { a } from 'react-spring/three'
import { PerspectiveCamera } from 'drei';

import './TreeOnACube.css';
import Tree from './models/Tree'

extend({ OrbitControls });

const Controls = () => {
  const orbitRef = useRef();
  const { camera, gl } = useThree();

  useFrame(() => {
    orbitRef.current.update();
  });

  return (
    <orbitControls
      autoRotate
      args={[camera, gl.domElement]}
      ref={orbitRef}
    />
  )
}

const Box = () => {
  return (
    <a.mesh
      position={[0, -4, 0]}        
      castShadow
      receiveShadow
    >
      <boxBufferGeometry attach='geometry' args={[1, 1, 1]} />
      <a.meshPhysicalMaterial attach='material' color="gray" />
    </a.mesh>
  );
}

const Camera = () => {
  return (
    <PerspectiveCamera makeDefault position={[10, 10, 25]} fov={18} aspect={1} />
  );
}

export default () => {
  return (
    <>
      <Canvas
        width={200}
        height={300}
        onCreated={({ gl }) => {
          gl.shadowMap.enabled = true
          gl.shadowMap.type = THREE.PCFSoftShadowMap
        }}
      >
        <Camera />
        <ambientLight intensity={0.75} />
        <spotLight position={[15, 20, 5]} penumbra={1} castShadow />
        <Controls />
        <Suspense fallback={<></>}> 
          <Tree position={[0, -3, 0]} />
        </Suspense>
          <Box />
      </Canvas>
    </>
  )
}