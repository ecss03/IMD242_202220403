void setup() {
  size(500, 300);
  rectMode(CENTER);
}

void draw() {
  background(0);

  // 도형 크기 설정
  float shapeSize = 50;

  // mouseY 위치에 따라 도형 그리기
  if (mouseY < height / 4) {
    // 첫 번째 칸: 원 그리기
    ellipse(width / 2, height / 8, shapeSize, shapeSize);
  } else if (mouseY < height / 2) {
    // 두 번째 칸: 정사각형 그리기
    rectMode(CENTER);
    rect(width / 2, 3 * height / 8, shapeSize, shapeSize);
  } else if (mouseY < 3 * height / 4) {
    // 세 번째 칸: 대각선 그리기
    line(width / 2 - shapeSize / 2, 5 * height / 8 - shapeSize / 2, width / 2 + shapeSize / 2, 5 * height / 8 + shapeSize / 2);
  } else {
    // 네 번째 칸: 가로형 직사각형 그리기
    rect(width / 2, 7 * height / 8, shapeSize * 2, shapeSize / 2);
  }
    
  stroke(127);
  strokeWeight(2);
  line(0, height / 4, width, height / 4);   // 첫 번째 가로선
  line(0, height / 2, width, height / 2);   // 두 번째 가로선
  line(0, 3 * height / 4, width, 3 * height / 4); // 세 번째 가로선
  
}
