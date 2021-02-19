// @ts-ignore
import { AsBind } from 'as-bind';
import { PathfindingModule, Finder, Obstacle } from "./interfaces";

let grid: Int8Array;
let finder: Finder;
let height = 1;

async function initPathfinding(): Promise<void> {
  const { exports } = await AsBind.instantiate(fetch("node_modules/assemblyscript-pathfinding/build/as-pathfinding.wasm"));
  const { findPath } = exports;
  finder = findPath;

  return;
}

function startPathFinding(_width: number, _height: number): boolean {
  grid = new Int8Array(_width * _height + 2);
  grid[0] = _height;
  grid[1] = _width;
  height = _height;

  return true;
}
function setObstacles(obstacles: Array<Obstacle>): boolean {
  obstacles.forEach(({ x, y }) => {
    grid[2 + (y * height + x)] = 1;
  });

  return true;
}

function findPath(from: [number, number, number], to: [number, number, number]): Array<number[]> {
  const res = finder(
    grid,
    Math.trunc(from[2] / 2),
    Math.trunc(from[0] / 2),
    Math.trunc(to[2] / 2),
    Math.trunc(to[0] / 2),
  );

  const path = [];
  for (let i = 0; i < res.length - 1; i += 2) {
    path.push([res[i], res[i + 1]]);
  }

  return path;
}

function findPathAsync(from: [number, number, number], to: [number, number, number]): Promise<Array<number[]>> {
  return new Promise((resolve, reject) => {
    resolve(findPath(from, to));
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
