import React, { useRef, Suspense, memo, useEffect, useState, useContext } from 'react';
import { ForestGenerator } from './utils/ForestGenerator';
import Tree from './models/Tree'
import { MultipleSelectTool } from './MultipleSelectTool';
import { Context } from './context';

export const forest = new ForestGenerator(50, 50, 10);

export const Landscape = ({ handleClick, handleMove, isMultipleSelectActive, onSelect }) => {
  const isRotated = useRef(false);
  const isPointerDown = useRef(false);
  const [mstStart, setMstStart] = useState([0, 0]);
  const [mstEnd, setMstEnd] = useState([0, 0]);
  const [isSelecting, setIsSelecting] = useState(false);
  const { playersState } = useContext(Context);

  function handlePointerMove(e) {    
    if (isMultipleSelectActive) {
      e.stopPropagation();
      setMstEnd([e.point.x, e.point.z]);
      return;
    }
    if (isPointerDown.current) {
      isRotated.current = true;
    }
    handleMove(e);
  }
  function handlePointerDown(e) {
    if (isMultipleSelectActive) {
      e.stopPropagation();
      setMstStart([e.point.x, e.point.z]);
      setMstEnd([e.point.x, e.point.z]);
      setIsSelecting(true);
      return;
    }
    isPointerDown.current = true;
  }
  function handlePointerUp(e) {
    if (isMultipleSelectActive) {
      e.stopPropagation();
      setIsSelecting(false);
      const startX = Math.min(mstStart[0], mstEnd[0]);
      const startY = Math.min(mstStart[1], mstEnd[1]);
      const endX = Math.max(mstStart[0], mstEnd[0]);
      const endY = Math.max(mstStart[1], mstEnd[1]);
      const caughtPlayers = [];
      for (const id in playersState.position) {
        if (playersState.position[id][0] > startX &&
            playersState.position[id][0] < endX &&
            playersState.position[id][2] > startY &&
            playersState.position[id][2] < endY
          ) {
            caughtPlayers.push(id);
          }
      }
      console.log({caughtPlayers})
      onSelect(caughtPlayers);
      return;
    }
    if (!isRotated.current) {
      handleClick(e);
    }
    isRotated.current = false;
    isPointerDown.current = false;
  }

  return (
    <Suspense fallback={<></>}>
      <mesh
        rotation={[-Math.PI / 2, 0, 0]}
        position={[50, -0.5, 50]}
        receiveShadow
        onPointerUp={handlePointerUp}
        onPointerDown={handlePointerDown}
        onPointerMove={handlePointerMove}
      >
        <planeBufferGeometry attach='geometry' args={[100, 100, 100, 100]} />
        <meshPhysicalMaterial attach='material' color='darkgreen' />
      </mesh>
      <MultipleSelectTool isEnabled={isSelecting} start={mstStart} end={mstEnd} />
    </Suspense>
  );
}

export const Pines = memo(({ setObstacles }) => {
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
