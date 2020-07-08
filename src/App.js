import React, { useState, useRef, useEffect, Suspense, memo } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend, useThree, useFrame } from 'react-three-fiber';
import { PerspectiveCamera } from 'drei';
import { ForestGenerator } from './utils/ForestGenerator';
import Pathfinding from './utils/pathfinding/as';

import './App.css';
import Tree from './models/Tree'
import PlayerModel from './models/Player'

const forest = new ForestGenerator(50, 50, 10);
const { startPathFinding, setObstacles, findPath, findPathAsync, initPathfinding } = Pathfinding;

extend({ OrbitControls });

const Controls = memo(({ position, target }) => {
  const orbitRef = useRef();
  const { camera, gl } = useThree();

  useEffect(() => {
    camera.lookAt(position)
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

const Pines = memo(() => {
  const [trees, setTrees] = useState([]);
  useEffect(() => {
    const map = forest.generate();
    setTrees(map);
    setObstacles(map);
  }, []);

  return (
    <Suspense fallback={<></>}>
      {trees.map(({ x, y, age }) => (<Tree
        position={[
          x * 2 + Math.random(),
          0.2,
          y * 2 + Math.random()
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

const Path = ({ points, target }) => {
  return <>
    <mesh position={[target[0], -0.5, target[2]]} castShadow>
      <boxBufferGeometry attach='geometry' args={[0.25, 0.1, 0.25]} />
      <meshPhysicalMaterial attach='material' color='darkgreen' />
    </mesh>
    {points.slice(1).map(p => (
      <mesh position={[p[1] * 2, -0.5, p[0] * 2]} castShadow>
        <boxBufferGeometry attach='geometry' args={[0.25, 0.1, 0.25]} />
        <meshPhysicalMaterial attach='material' color='green' />
      </mesh>
    ))}
  </>
}

const Plane = ({ handleClick, handleMove }) => {
  return (
    <mesh rotation={[-Math.PI / 2, 0, 0]} position={[50, -0.5, 50]} receiveShadow onClick={handleClick} onPointerMove={handleMove}>
      <planeBufferGeometry attach='geometry' args={[100, 100, 100, 100]} />
      <meshPhysicalMaterial attach='material' color='darkgreen' />
    </mesh>
  );
}

const Camera = ({ position }) => {
  return (
    <PerspectiveCamera makeDefault position={position} fov={15} />
  );
}

export default () => {
  const [playerPosition, setPlayerPosition] = useState([25, 0, 25]);
  const [targetPosition, setTargetPosition] = useState([25, 0, 25]);
  const [cameraPosition, setCameraPosition] = useState([60, 5, 75]);
  const [path, setPath] = useState([]);
  const [isWalking, setIsWalking] = useState(false);
  const [isWasmReady, setWasmReady] = useState(false);
  const [isWorkerBusy, setIsWorkerBusy] = useState(false);
  function handleClick(e) {
    setIsWalking(!isWalking);
  }
  async function handleMove(e) {
    if (isWorkerBusy) {
      return;
    }
    setIsWorkerBusy(true);
    const newTarget = [e.point.x, e.point.y, e.point.z];
    setTargetPosition(newTarget);
    const path = await findPathAsync(playerPosition, newTarget);
    setIsWorkerBusy(false);
    setPath(path);
  }

  const lightTarget = new THREE.Object3D();
  lightTarget.position.set(50, 0, 50);

  useEffect(() => {
    if (isWasmReady) {
      startPathFinding(50, 50);
    }
  }, [isWasmReady]);
  useEffect(() => {
    initPathfinding().then(() => setWasmReady(true));
  }, []);

  return isWasmReady && (
    <Canvas
      onCreated={({ gl }) => {
        gl.shadowMap.enabled = true
        gl.shadowMap.type = THREE.PCFSoftShadowMap
        // gl.physicallyCorrectLights = true;
      }}
    >
      <Camera position={cameraPosition} />
      <ambientLight intensity={0.75} />
      <spotLight
        position={[50, 10, 50]}
        penumbra={1}
        decay={2}
        castShadow
      />
      {/* <fog attach='fog' args={['black', 75, 100]} /> */}
      <Controls position={playerPosition} target={playerPosition} />
      <Suspense fallback={<></>}>
        <PlayerModel position={playerPosition} isWalking={isWalking} />
      </Suspense>
      <Suspense fallback={<></>}>
        <Plane handleClick={handleClick} handleMove={handleMove} />
      </Suspense>
      <Pines />
      <Path points={path} target={targetPosition} />
    </Canvas>
  );
}