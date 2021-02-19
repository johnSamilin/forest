import React, { memo } from 'react';
import isEqual from 'lodash/isEqual';

export const MultipleSelectTool = memo(({ isEnabled, start = [0, 0], end = [0, 0] }) => {
  return (
    <mesh
      rotation={[-Math.PI / 2, 0, 0]}
      visible={isEnabled && !isEqual(start, end)}
      position={[start[0] + ((end[0] - start[0]) / 2), 0, start[1] + ((end[1] - start[1]) / 2)]}
    >
      <planeBufferGeometry attach='geometry' args={[end[0] - start[0], end[1] - start[1], 1]} />
      <meshPhysicalMaterial attach='material' color='green' wireframe />
    </mesh>
  );
});
