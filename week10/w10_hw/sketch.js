let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];
let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];

let confetties;

function setup() {
  createCanvas(800, 800);
  confetties = new Confetties();
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  confetties.gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key === 'p' || key === 'P') {
    console.log('confetties: ' + confetties.getLength());
  }
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  confetties.update(gravity, friction);
  confetties.display();
}

class Confetti {
  constructor(x, y, colour) {
    this.pos = createVector(x, y);
    this.vel = createVector(random(-2, 2), random(-2, 2));
    this.acc = createVector(0, 0);
    this.colour = colour;
    this.size = random(5, 15);
  }

  applyForce(force) {
    this.acc.add(force);
  }

  update(gravity, friction) {
    this.applyForce(createVector(gravity[0], gravity[1]));
    this.vel.add(this.acc);
    this.vel.mult(friction);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  display() {
    noStroke();
    fill(this.colour);
    ellipse(this.pos.x, this.pos.y, this.size);
  }
}

class Confetties {
  constructor() {
    this.confetties = [];
  }

  gen(x, y, count) {
    for (let i = 0; i < count; i++) {
      let colour = random(colours);
      this.confetties.push(new Confetti(x, y, colour));
    }
  }

  update(gravity, friction) {
    for (let confetti of this.confetties) {
      confetti.update(gravity, friction);
    }
  }

  display() {
    for (let confetti of this.confetties) {
      confetti.display();
    }
  }

  getLength() {
    return this.confetties.length;
  }
}
