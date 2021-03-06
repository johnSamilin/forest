import { Grid, BiBestFirstFinder, Heuristic, Util } from "pathfinding";
import { PathfindingModule, Obstacle } from "./interfaces";

let grid: Grid;
let finder: BiBestFirstFinder;

async function initPathfinding(): Promise<void> {
  return Promise.resolve();
}

function startPathFinding(width: number, height: number): boolean {
  grid = new Grid(width, height);
  finder = new BiBestFirstFinder({
    heuristic: Heuristic.octile,
    //@ts-ignore
    allowDiagonal: true,
  });

  return true;
}
function setObstacles(obstacles: Array<Obstacle>): boolean {
  obstacles.forEach(({ x, y }) => {
    grid.setWalkableAt(y, x, false);
  });

  return true;
}

function findPath(from: [number, number, number], to: [number, number, number]): Array<number[]> {
  const path = finder.findPath(
    Math.trunc(from[2] / 2),
    Math.trunc(from[0] / 2),
    Math.trunc(to[2] / 2),
    Math.trunc(to[0] / 2),
    grid.clone()
  );

  if (path.length === 0) {
    return path;
  }

  return path; /*Util.smoothenPath(
    grid,
    path
  );*/
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
