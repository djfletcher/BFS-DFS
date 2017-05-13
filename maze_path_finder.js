// Problem described here: https://www.techiedelight.com/lee-algorithm-shortest-path-in-a-maze/
let { Queue } = require('./queue.js');

function path(start, end, maze) {
  let q = new Queue();
  let seen = {};

  // Enqueue tuples where first val is position and second val is distance from start
  q.enq([start, 0]);
  seen[stringify(start)] = true;

  while (q.length > 0) {
    let [pos, dist] = q.deq();

    for (let i in DELTAS) {
      let nextPos = DELTAS[i](pos);
      if (valid(nextPos, maze, seen)) {
        if (isEnd(nextPos, end)) { return dist + 1; }
        q.enq([nextPos, dist + 1]);
        seen[stringify(nextPos)] = true;
      }
    }
  }

  return null;
}

function isEnd(pos, end) { return stringify(pos) === stringify(end); }

function stringify([x, y]) { return `x${x}y${y}`; }

function valid([x, y], maze, seen) {
  return y >= 0 && y < maze.length && maze[y][x] === 1 && !seen[stringify([x, y])];
}

const DELTAS = [
  ([x, y]) => [x, y - 1],
  ([x, y]) => [x, y + 1],
  ([x, y]) => [x - 1, y],
  ([x, y]) => [x + 1, y],
];


// TESTS
let maze = [
  [1, 1, 1, 1, 1, 0, 0, 1, 1, 1],
  [0, 1, 1, 1, 1, 1, 0, 1, 0, 1],
  [0, 0, 1, 0, 1, 1, 1, 0, 0, 1],
  [1, 0, 1, 1, 1, 0, 1, 1, 0, 1],
  [0, 0, 0, 1, 0, 0, 0, 1, 0, 1],
  [1, 0, 1, 1, 1, 0, 0, 1, 1, 0],
  [0, 0, 0, 0, 1, 0, 0, 1, 0, 1],
  [0, 1, 1, 1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0, 1, 1, 1],
  [0, 0, 1, 0, 0, 1, 1, 0, 0, 1]
];

console.log(path([0, 0], [1, 1], maze) === 2);
console.log(path([0, 0], [7, 5], maze) === 12);
console.log(path([3, 5], [9, 9], maze) === 10);
console.log(path([3, 5], [9, 6], maze) === null);
