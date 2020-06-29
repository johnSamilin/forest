import { Tree } from "./ForestGenerator";

async function init() {
  await import("../lib/wasm_exec.js");
  // @ts-ignore
  const go = new Go();
  const response = await fetch('../lib/pathfinding.wasm');
  const bytes = await response.arrayBuffer();
  const result = await WebAssembly.instantiate(bytes, go.importObject);
  
  go.run(result.instance);
}

export function startPathFinding(width: number, height: number) {
  //@ts-ignore
  window.setGrid(width, height);
}
export function setObstacles(obstacles: Array<Tree>) {
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
}

export function findPath(from: [number, number, number], to: [number, number, number]) {
  //@ts-ignore
  const rawPath = window.findPath(from[0] / 2, from[2] / 2, to[0] / 2, to[2] / 2);
  const path = [];
  for (let i=0, j=0; i<rawPath.length; i+=2, j++) {
    path[j] = [rawPath[i], rawPath[i+1]];
  }
  return path;
}

init();
