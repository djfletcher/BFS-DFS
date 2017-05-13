class Queue {
  constructor() {
    this.q = [];
    this.length = 0;
  }

  enq(el) {
    this.length += 1;
    return this.q.push(el);
  }

  deq() {
    if (this.length > 0) {
      this.length -= 1;
      return this.q.shift();
    }
  }
}
