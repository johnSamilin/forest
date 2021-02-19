import "go-pathfinding/wasm_exec";
import { PathfindingModule, Obstacle } from "./interfaces";

async function initPathfinding(): Promise<void> {
  // @ts-ignore
  const go = new Go();
  const response = await fetch('node_modules/go-pathfinding/build/go-pathfinding.wasm');
  const bytes = await response.arrayBuffer();
  const result = await WebAssembly.instantiate(bytes, go.importObject);
  
  go.run(result.instance);
}

function startPathFinding(width: number, height: number): boolean {
  //@ts-ignore
  window.setGrid(width, height);

  return true;
}
function setObstacles(obstacles: Array<Obstacle>): boolean {
  const obstaclesArray: Array<number> = obstacles.reduce((
    aggr: Array<number>,
    {x, y}
  ) => {
    aggr.push(x);
    aggr.push(y);
    return aggr;
  }, []);
  //@ts-ignore
  window.setObstacles(...obstaclesArray);

  return true;
}

function findPath(from: [number, number, number], to: [number, number, number]): Array<number[]> {
  //@ts-ignore
  const rawPath = window.findPath(from[0] / 2, from[2] / 2, to[0] / 2, to[2] / 2);
  const path = [];
  for (let i=0, j=0; i<rawPath.length; i+=2, j++) {
    path[j] = [parseInt(rawPath[i], 10), parseInt(rawPath[i+1], 10)];
  }
  return path;
}

function findPathAsync(from: [number, number, number], to: [number, number, number]): Promise<Array<number[]>> {
  return new Promise((res) => {
    res(findPath(from, to));
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
