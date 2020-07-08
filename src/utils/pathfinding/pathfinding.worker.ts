import Pathfinding from './js';

/* eslint-disable no-restricted-globals */
const ctx: Worker = self as any;
 
// Respond to message from parent thread
ctx.addEventListener("message", (e) => {
  if (!e.data.pathfinding) {
    return;
  }
  const { operation, payload } = e.data.pathfinding;
  switch (operation) {
    case 'start':
      Pathfinding.startPathFinding(payload.width, payload.height);
      break;
    case 'setObstacles':
      Pathfinding.setObstacles(payload.obstacles);
      break;
    case 'findPath':
      const path = Pathfinding.findPath(payload.from, payload.to);
      ctx.postMessage({
        pathfindingResult: {
          operation: 'findPath',
          result: path,
        },
      });
      break;
  }
});

export default {} as typeof Worker & (new () => Worker);
