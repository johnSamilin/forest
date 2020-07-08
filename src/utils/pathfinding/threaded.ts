import Worker from './pathfinding.worker';
import { Tree } from '../ForestGenerator';
import { PathfindingModule } from './interfaces';

const worker = new Worker();

async function initPathfinding(): Promise<void> {
  return Promise.resolve();
}

function startPathFinding(width: number, height: number): boolean {
  worker.postMessage({
    pathfinding: {
      operation: 'start',
      payload: {
        width,
        height,
      },
    },
  });

  return true;
}
function setObstacles(obstacles: Array<Tree>): boolean {
  worker.postMessage({
    pathfinding: {
      operation: 'setObstacles',
      payload: {
        obstacles,
      },
    },
  });

  return true;
}

function findPath(from: [number, number, number], to: [number, number, number]): Array<number[]> {
  return [[1, 1]];
}

async function findPathAsync(from: [number, number, number], to: [number, number, number]): Promise<Array<number[]>> {
  return new Promise((res, rej) => {
    worker.postMessage({
      pathfinding: {
        operation: 'findPath',
        payload: {
          from,
          to,
        },
      },
    });
    worker.onmessage = (event: MessageEvent) => {
      if (event.data.pathfindingResult && event.data.pathfindingResult.operation === 'findPath') {
        res(event.data.pathfindingResult.result);
      }
    }
  });
}

const Module: PathfindingModule = {
  initPathfinding,
  startPathFinding,
  setObstacles,
  findPath,
  findPathAsync,
};

export default Module;
