// Problem described here: https://www.techiedelight.com/lee-algorithm-shortest-path-in-a-maze/


function stringify([x, y]) { return `x${x}y${y}`; }

function valid([x, y], maze, seen) {
  if (y >= 0 && y < maze.length && maze[y][x] === 1 && !seen[stringify([x, y])]) {
    return true;
  } else {
    return false;
  }
}

const DELTAS = [
  ([x, y]) => [x, y - 1],
  ([x, y]) => [x, y + 1],
  ([x, y]) => [x - 1, y],
  ([x, y]) => [x + 1, y],
];
