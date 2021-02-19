import React, { useState, useEffect, useReducer } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { Canvas, extend } from 'react-three-fiber';
import Pathfinding from './utils/pathfinding/threaded';
import { movePlayer } from './reducers/players';
import { Character } from './Character';
import { Landscape, Pines } from './Landscape';
import { Controls, Camera } from './Camera';
import { Context } from './context';
import { playersReducer } from './reducers/players';

import './App.css';

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
  const [activePlayers, setActivePlayers] = useState(['oldman']);
  const [cameraControlsPosition, setCameraControlsPosition] = useState([25, 0, 25])
  const [targetPosition, setTargetPosition] = useState([25, 0, 25]);
  const [cameraPosition, setCameraPosition] = useState([60, 5, 75]);
  const [path, setPath] = useState([]);
  const [isWasmReady, setWasmReady] = useState(false);
  const [isWorkerBusy, setIsWorkerBusy] = useState(false);
  const [isMultipleSelectActive, setMultipleSelectActive] = useState(false);

  const playerIds = [
    'oldman',
    'ninja-1',
    'Manequin-2',
    'Manequin-3',
    'Manequin-4',
    'Manequin-5',
  ];
  const [playersState, dispatch] = useReducer(playersReducer, {
    movement: playerIds.reduce((acc, id) => ({ ...acc, [id]: null }), {}),
    position: playerIds.reduce((acc, id, index) => ({ ...acc, [id]: [25 + index, 0, 25 + index] }), {}),
  });

  async function handleFloorClick(e) {
    e.stopPropagation();
    if (isWorkerBusy) {
      return;
    }
    for (const player of activePlayers) {
      const path = await searchPath(
        playersState.position[player],
        [e.point.x, e.point.y, e.point.z]
      );
      if (path) {
        dispatch(movePlayer(player, path));
      }
    }
  }
  function handleCharClick(e, playerId) {
    e.stopPropagation();
    if (isMultipleSelectActive) {
      const newActivePlayers = activePlayers.find(id => id === playerId)
        ? activePlayers.filter(id => id !== playerId)
        : activePlayers.concat([playerId]);
      setActivePlayers(newActivePlayers);
    } else {
      setActivePlayers([playerId]);
    }
  }
  async function searchPath(from, to) {
    if (isWorkerBusy) {
      return [];
    }
    setIsWorkerBusy(true);
    const path = await findPathAsync(from, to);
    setIsWorkerBusy(false);
    return path;
  }
  async function handleMove(e) {
    const newTarget = [e.point.x, e.point.y, e.point.z];
    const path = await searchPath(playersState.position[activePlayers[0]], newTarget);
    setTargetPosition(newTarget);    
    setPath(path);
  }

  useEffect(() => {
    if (isWasmReady) {
      startPathFinding(50, 50);
    }
  }, [isWasmReady]);
  useEffect(() => {
    initPathfinding().then(() => setWasmReady(true));
  }, []);

  function handleKeydown(e) {
    if (e.nativeEvent.keyCode === 16 && !isMultipleSelectActive) {
      // left shift
      setMultipleSelectActive(true);
    }
  }
  function handleKeyup(e) {
    if (e.nativeEvent.keyCode === 16 && isMultipleSelectActive) {
    // left shift
    setMultipleSelectActive(false);
  }
  }

  return isWasmReady && (
    <Canvas
      onCreated={({ gl }) => {
        gl.shadowMap.enabled = true
        gl.shadowMap.type = THREE.PCFSoftShadowMap
        // gl.physicallyCorrectLights = true;
      }}
      shadowMap
      onKeyDown={handleKeydown}
      onKeyUp={handleKeyup}
    >
      <Camera position={cameraPosition} />
      <Controls position={cameraControlsPosition} target={cameraControlsPosition} isEnabled={!isMultipleSelectActive} />
      <ambientLight intensity={0.75} />
      {/* <fog attach='fog' args={['black', 75, 100]} /> */}

      <Context.Provider value={{ dispatch, playersState }}>
        {playerIds.map((id) => <Character
          id={id}
          position={playersState.position[id]}
          model="player/Manequin"
          isSelected={activePlayers.includes(id)}
          onClick={handleCharClick}
        />)}
        <Landscape
          handleClick={handleFloorClick}
          handleMove={handleMove}
          isMultipleSelectActive={isMultipleSelectActive}
          onSelect={setActivePlayers}
        />
      </Context.Provider>
      <Pines setObstacles={setObstacles} />
      <Path points={path} target={targetPosition} />
    </Canvas>
  );
}