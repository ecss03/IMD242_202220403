let tileNumX = 16;
let tileNumY = 12;

function setup() {
  createCanvas(640, 480);
}

function draw() {
  background('#333333');
  noStroke();
  fill('cornflowerblue'); // 자바와 다르게 수가 아닌 영어를 써도 가능함
  //int, float 구분해서 안쓰고 무조건 let을 씀
  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < height; row += 40) {
  //     let x = 20 + column;
  //   let y = 20 + row;
  //   let diameter = 30;
  //   circle(x, y, diameter);
  //   }
  // }
  for (let row = 0; row < tileNumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / tileNumX;
      let tileH = height / tileNumY;
      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }
}
