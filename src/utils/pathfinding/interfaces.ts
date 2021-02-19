export interface Obstacle {
  x: number;
  y: number;
}

export interface PathfindingModule {
  initPathfinding: () => Promise<void>;
  startPathFinding: (width: number, height: number) => boolean;
  setObstacles: (obstacles: Array<Obstacle>) => boolean;
  findPath: (from: [number, number, number], to: [number, number, number]) => Array<number[]>;
  findPathAsync: (from: [number, number, number], to: [number, number, number]) => Promise<Array<number[]>>;
}

export type Finder = (grid: Int8Array, ax: number, ay: number, bx: number, by: number) => Int8Array;
