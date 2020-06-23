import React, { useState, useRef, useEffect, Suspense, memo } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend, useThree, useFrame, useLoader } from 'react-three-fiber'
import { useSpring, a } from 'react-spring/three'
import { PerspectiveCamera } from 'drei';
import { ForestGenerator } from "./utils/ForestGenerator";

import './App.css';
import Tree from './models/Tree'

const forest = new ForestGenerator(50, 50, 10);

extend({ OrbitControls });

const Controls = () => {
  const orbitRef = useRef();
  const { camera, gl } = useThree();

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
}

const Pines = memo(() => {
  const [trees, setTrees] = useState([]);
  useEffect(() => {
    const map = forest.generate();
    setTrees(map);
  }, []);

  return (
    <Suspense fallback={<></>}>
      {trees.map(({ x, y, age }) => (<Tree
        position={[
          (x - 25) * 2 + Math.random(),
          0.2,
          (y - 25) * 2 + Math.random()
        ]}
        scale={[
          0.2 + age * 0.1,
          0.2 + age * 0.1,
          0.2 + age * 0.1
        ]}
      />))}
    </Suspense>
  );
});

const Plane = () => {
  return (
    <mesh rotation={[-Math.PI / 2, 0, 0]} position={[0, -0.5, 0]} receiveShadow>
      <planeBufferGeometry attach='geometry' args={[100, 100, 100, 100]} />
      <meshPhysicalMaterial attach='material' color="darkgreen" />
    </mesh>
  );
}

const Box = ({ position }) => {
  const [hovered, setHovered] = useState(false)
  const [active, setActive] = useState(false)
  const { scale, color, position: aPosition } = useSpring({
    scale: active ? [1.5, 1.5, 1.5] : [1, 1, 1],
    color: hovered ? 'hotpink' : 'gray',
    position,
    config: {
      duration: 1000
    }
  })

  return (
    <a.mesh
      onPointerOver={() => setHovered(true)}
      onPointerOut={() => setHovered(false)}
      onClick={() => setActive(!active)}
      scale={scale}
      position={aPosition}
      castShadow
    >
      <boxBufferGeometry attach='geometry' args={[1, 1, 1]} />
      <a.meshPhysicalMaterial attach='material' color={color} />
    </a.mesh>
  )
}

const Camera = ({ position, target }) => {
  return (
    <PerspectiveCamera makeDefault position={position} fov={35} />
  );
}

export default () => {
  const [playerPosition, setPlayerPosition] = useState([0, 0, 0]);
  const [cameraPosition, setCameraPosition] = useState();

  return <>
      <Canvas
      onCreated={({ gl }) => {
        gl.shadowMap.enabled = true
        gl.shadowMap.type = THREE.PCFSoftShadowMap
      }}
    >
      <Camera position={[10, 10, 25]} />
      <ambientLight intensity={0.75} />
      <spotLight position={[15, 20, 5]} penumbra={1} castShadow />
      <Controls position={[0, 0, 0]} />
      <Box position={playerPosition} />
      <Suspense fallback={<></>}>
        <Plane />
      </Suspense>
      <Pines />
    </Canvas>
  </>
}