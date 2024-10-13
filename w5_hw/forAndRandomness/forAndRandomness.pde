int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;

void setup() {
  size(800, 800);
}

void draw() {
  noiseSeed(randomSeed);
  background(0);

  // 마우스 X축에 따라 타일 수를 설정
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));

  // 마우스 Y축에 따라 노이즈 멀티플라이어 설정 (지수적 감소)
  noiseMult = pow(10, map(mouseY, 0, height, -1, -4));

  float tileSize = width / float(tileNum); // 타일의 크기 계산

  // 타일 그리기
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;

      // 노이즈 값을 기반으로 각도 계산
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);

      // 큰 원 그리기 (검정색 내부, 흰색 테두리)
      fill(0);
      stroke(255);
      strokeWeight(1);
      circle(centerX, centerY, tileSize * 1);

      // 작은 원과 선을 그리기 위한 회전 설정
      pushMatrix();
      translate(centerX, centerY); // 원의 중심으로 이동
      rotate(radians(300 * noiseVal));

      // 작은 원의 위치 계산 (큰 원을 넘지 않도록 조정)
      float lineLength = tileSize * 0.42;
      float smallCircleX = lineLength;
      float smallCircleY = 0;

      // 선
      stroke(255);
      line(0, 0, smallCircleX, smallCircleY);

      // 작은 원
      fill(255);
      circle(smallCircleX, smallCircleY, tileSize * 0.15);

      popMatrix(); // 회전 상태 해제
    }
  }
}
