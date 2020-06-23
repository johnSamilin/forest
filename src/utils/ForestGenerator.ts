// based on https://github.com/wesleykerr/level-generator/blob/master/core/src/main/java/com/seekerr/games/procedural/ForestGenerationImpl.java

const FOREST_STATE_EMPTY = 1;
const FOREST_STATE_FOREST = 2;
const FOREST_STATE_SEEDED = 3;

export class Tree {
  x: number;
  y: number;
  age: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
    this.age = 1;
  }
};

export class ForestGenerator {
  initialTrees: number;
  seedRadius: number = 5;
  seedDecay: number = 0.3;
  seedStrength: number = 0.1;

  desiredCoverage: number = 0.2;
  seed: number = 7;
  width: number;
  height: number;
  forest: number[][];
  trees: Array<Tree> = [];
  seeds: Map<String, number> = new Map();

  constructor(height: number = 100, width: number = 100, initialTrees: number = 10) {
    this.height = height;
    this.width = width;
    this.initialTrees = initialTrees;

    this.forest = Array(width).fill(FOREST_STATE_EMPTY);
    this.forest = this.forest.map(col => Array(height).fill(FOREST_STATE_EMPTY));
    for (let i = 0; i < this.initialTrees; ++i) {
      while (true) {
        const x = Math.ceil(Math.random() * this.width);
        const y = Math.ceil(Math.random() * this.height);
        if (this.forest[x][y] === FOREST_STATE_EMPTY) {
          this.forest[x][y] = FOREST_STATE_FOREST;
          this.addTree(x, y);
          break;
        }
      }
    }
  }

  generate() {
    let currentlyCovered = this.getCoverage();
    while (currentlyCovered < this.desiredCoverage) {
      this.step();
      currentlyCovered = this.getCoverage();
    }
    this.removeSeeds();

    return this.trees;
  }

  removeSeeds() {
    for (let [coords] of this.seeds.entries()) {
      const [x, y] = coords.split(',').map(x => parseInt(x));
      this.forest[x][y] = FOREST_STATE_EMPTY;
    }
  }

  getCoverage() {
    const size = this.width * this.height;
    return this.trees.length / size;
  }

  addTree(x: number, y: number) {
    this.trees.push(new Tree(x, y));
    this.forest[x][y] = FOREST_STATE_FOREST;
  }

  step() {
    // гибель семян
    const tmpMap: Map<String, number> = new Map();
    for (const [coords, strength] of this.seeds.entries()) {
      tmpMap.set(coords, strength - (this.seedDecay * strength));
    }
    this.seeds = tmpMap;

    // рост деревьев
    for (const [coords, strength] of this.seeds.entries()) {
      if (Math.random() < strength) {
        const [x, y] = coords.split(',').map(x => parseInt(x));
        this.addTree(x, y);
      }
    }
    this.trees = this.trees.map(tree => {
      tree.age++;
      return tree;
    })

    // убираем семена в случае, когда они проросли
    for (const index in this.trees) {
      const p = this.trees[index];
      const key = p.x + "," + p.y;
      if (this.seeds.has(key))
        this.seeds.delete(key);
    }

    this.seedTrees();
  }

  seedTrees() {
    for (const index in this.trees) {
      const tree = this.trees[index];
      const [xMin, xMax, yMin, yMax] = [
        Math.max(tree.x - this.seedRadius, 0),
        Math.min(tree.x + this.seedRadius, this.width),
        Math.max(tree.y - this.seedRadius, 0),
        Math.min(tree.y + this.seedRadius, this.height),
      ];

      for (let i = 0; i <= tree.age * 2; i++) {        
        const x = Math.trunc(xMin + Math.random() * (xMax - xMin));
        const y = Math.trunc(yMin + Math.random() * (yMax - yMin));
        if (this.forest[x][y] === FOREST_STATE_FOREST)
          continue;

        this.forest[x][y] = FOREST_STATE_SEEDED;
        const key = x + "," + y;
        const value = this.seeds.get(key) || 0;
        this.seeds.set(key, value + this.seedStrength);
      }
    }
  }
}