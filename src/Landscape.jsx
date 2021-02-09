import React, { useRef, Suspense, memo, useEffect, useState } from 'react';
import { ForestGenerator } from './utils/ForestGenerator';
import Tree from './models/Tree'

export const forest = new ForestGenerator(50, 50, 10);

export const Landscape = ({ handleClick, handleMove }) => {
  const isRotated = useRef(false);
  const isPointerDown = useRef(false);
  function handleRotate(e) {
    if (isPointerDown.current) {
      isRotated.current = true;
    }
    handleMove(e);
  }
  function handlePointerDown() {
    isPointerDown.current = true;
  }
  function handlePointerUp(e) {
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
        onPointerMove={handleRotate}
      >
        <planeBufferGeometry attach='geometry' args={[100, 100, 100, 100]} />
        <meshPhysicalMaterial attach='material' color='darkgreen' />
      </mesh>
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
