import React, { useState, useEffect } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend } from 'react-three-fiber';

import Pathfinding from './utils/pathfinding/threaded';

import './App.css';
import { Character } from './Character';
import { Landscape, Pines } from './Landscape';
import { Controls, Camera } from './Camera';
import OldMan from './models/OldMan';

const { startPathFinding, setObstacles, findPathAsync, initPathfinding } = Pathfinding;

extend({ OrbitControls });

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

export default () => {
  const [playerPosition, setPlayerPosition] = useState([25, 0, 25]);
  const [cameraControlsPosition, setCameraControlsPosition] = useState(playerPosition)
  const [targetPosition, setTargetPosition] = useState([25, 0, 25]);
  const [cameraPosition, setCameraPosition] = useState([60, 5, 75]);
  const [path, setPath] = useState([]);
  const [isWalking, setIsWalking] = useState(false);
  const [isWasmReady, setWasmReady] = useState(false);
  const [isWorkerBusy, setIsWorkerBusy] = useState(false);
  function handleClick(e) {
    if (isWorkerBusy || isWalking) {
      return;
    }
    setIsWalking(!isWalking);
  }
  async function handleMove(e) {
    if (isWorkerBusy || isWalking) {
      return;
    }
    setIsWorkerBusy(true);
    const newTarget = [e.point.x, e.point.y, e.point.z];
    setTargetPosition(newTarget);
    const path = await findPathAsync(playerPosition, newTarget);
    setIsWorkerBusy(false);
    setPath(path);
  }

  function handlePlayerWent(x, y, z) {
    setIsWalking(false);
    setPlayerPosition([x, y, z]);
    setCameraControlsPosition([x, y, z]);
    // так камера перемещается правильно, но ее в процессе нельзя вращать и масштабировать
    // setCameraPosition([x + 35, y + 5, z + 50]);
  }

  function handlePlayerMove(x, y, z) {
    setCameraControlsPosition([x, y, z]);
    // setCameraPosition([x + 35, y + 5, z + 50]);
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
      <Controls position={cameraControlsPosition} target={cameraControlsPosition} />
      <ambientLight intensity={0.75} />
      <spotLight
        position={[cameraControlsPosition[0] + 2, 3, cameraControlsPosition[2] + 2]}
        penumbra={1}
        decay={1}
        castShadow
        angle={Math.PI}
        distance={50}
      />
      {/* <fog attach='fog' args={['black', 75, 100]} /> */}
      <Character
        position={playerPosition}
        isWalking={isWalking}
        path={isWalking ? path : null}
        onStopMoving={handlePlayerWent}
        onMove={handlePlayerMove}
        Model={OldMan}
      />
      <Landscape handleClick={handleClick} handleMove={handleMove} />
      <Pines setObstacles={setObstacles} />
      <Path points={path} target={targetPosition} />
    </Canvas>
  );
}