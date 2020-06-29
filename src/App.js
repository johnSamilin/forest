import React, { useState, useRef, useEffect, Suspense, memo } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend, useThree, useFrame, useLoader } from 'react-three-fiber'
import { useSpring, a } from 'react-spring/three'
import { PerspectiveCamera } from 'drei';
import MapleLeave from './textures/Maple-Leaf.png';

import { newTreeGeometry } from './utils/parse-tree'
import TreeGenerator from './utils/proctree';
import { ForestGenerator } from "./utils/ForestGenerator";
import { startPathFinding, setObstacles, findPath } from "./utils/pathfinding";

import './App.css';
import Tree from './models/Tree'
import PlayerModel from './models/Player'

const forest = new ForestGenerator(50, 50, 10);

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

const Pine = (props) => {
  var tree = new TreeGenerator({
    "seed": 262,
    "segments": Math.ceil(Math.random()) * 6,
    "levels": Math.ceil(Math.random()) * 5,
    "vMultiplier": 2.36,
    "twigScale": Math.random(),
    "initalBranchLength": Math.random(),
    "lengthFalloffFactor": 0.85,
    "lengthFalloffPower": 0.99,
    "clumpMax": 0.454,
    "clumpMin": 0.404,
    "branchFactor": 2.45,
    "dropAmount": -0.1,
    "growAmount": 0.235,
    "sweepAmount": 0.01,
    "maxRadius": 0.139,
    "climbRate": 0.371,
    "trunkKink": 0.093,
    "treeSteps": 5,
    "taperRate": 0.947,
    "radiusFalloffRate": 0.73,
    "twistRate": 3.02,
    "trunkLength": 2.4
  });
  const [leaveTexture] = useLoader(THREE.TextureLoader, [MapleLeave], () => ({ transparent: true }));

  const trunkGeo = newTreeGeometry(tree);
  const leavesGeo = newTreeGeometry(tree, true);

  return (
    <group {...props}>
      <mesh receiveShadow castShadow>
        <primitive attach="geometry" object={trunkGeo} />
        <meshLambertMaterial attach="material" color={0xdddddd} />
      </mesh>
      {/* <mesh>
        <primitive attach="geometry" object={leavesGeo} />        
        <meshLambertMaterial attach="material">
          <primitive attach="map" object={leaveTexture} />
        </meshLambertMaterial>
      </mesh> */}
    </group>
  );
}

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
    <mesh position={[target[0], 0, target[2]]} castShadow receiveShadow>
      <boxBufferGeometry attach='geometry' args={[0.25, 0.25, 0.25]} />
      <meshPhysicalMaterial attach='material' color="blue" />
    </mesh>
    {points.slice(1).map(p => (
      <mesh position={[p[1]*2, 0, p[0]*2]} castShadow receiveShadow>
        <boxBufferGeometry attach='geometry' args={[0.25, 0.25, 0.25]} />
        <meshPhysicalMaterial attach='material' color="red" />
      </mesh>
    ))}
  </>
}

const Plane = ({ handleClick }) => {
  return (
    <mesh rotation={[-Math.PI / 2, 0, 0]} position={[50, -0.5, 50]} receiveShadow onClick={handleClick}>
      <planeBufferGeometry attach='geometry' args={[100, 100, 100, 100]} />
      <meshPhysicalMaterial attach='material' color="darkgreen" />
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
  function handleClick(e) {
    const newTarget = [e.point.x, e.point.y, e.point.z];
    setTargetPosition(newTarget);
    setPath(findPath(playerPosition, newTarget));
    setIsWalking(!isWalking);
  }

  const lightTarget = new THREE.Object3D();
  lightTarget.position.set(50, 0, 50);

  useEffect(() => {
    startPathFinding(50, 50);
  }, []);

  return (
    <Canvas
      onCreated={({ gl }) => {
        gl.shadowMap.enabled = true
        gl.shadowMap.type = THREE.PCFSoftShadowMap
        // gl.physicallyCorrectLights = true;
      }}
    >
      <Camera position={cameraPosition} />
      <ambientLight intensity={0.75} castShadow />
      <spotLight
        position={[50, 10, 50]}
        penumbra={1}
        decay={2}
        castShadow
      />
      {/* <fog attach='fog' args={['black', 75, 100]} /> */}
      <Controls position={playerPosition} target={targetPosition} />
      <Suspense fallback={<></>}>
        <PlayerModel position={playerPosition} isWalking={isWalking} />
      </Suspense>
      <Suspense fallback={<></>}>
        <Plane handleClick={handleClick} />
      </Suspense>
      <Pines />
      <Path points={path} target={targetPosition} />
    </Canvas>
  );
}