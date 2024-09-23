boolean isBlinking = false; // 깜박임 상태 변수
int numStars = 15;  // 별의 개수
float[] starX = new float[numStars];  // 별의 x 좌표 배열
float[] starY = new float[numStars];  // 별의 y 좌표 배열

void setup() {
  size(640, 480); // 캔버스 크기 설정
  background(255); // 배경 흰색
  
  // 무작위로 별의 초기 위치 설정
  for (int i = 0; i < numStars; i++) {
    starX[i] = random(width);
    starY[i] = random(height);
  }
}

void draw() {
  background(255);
  
  // 마우스의 움직임에 따른 별 이동
  for (int i = 0; i < numStars; i++) {
    // 마우스의 이동 방향에 따라 별의 위치를 조금씩 이동
    starX[i] += (mouseX - pmouseX) * 0.1;  // 마우스 이동량의 5%만큼 별 이동
    starY[i] += (mouseY - pmouseY) * 0.1;
    
    // 별이 화면 밖으로 나가면 반대쪽으로 재배치
    if (starX[i] > width) starX[i] = 0;
    if (starX[i] < 0) starX[i] = width;
    if (starY[i] > height) starY[i] = 0;
    if (starY[i] < 0) starY[i] = height;
    
    // 별 그리기
    noStroke();       // 테두리 없음
    fill(255, 255, 0); // 노란색 별
    float radius1 = random(50, 60);  // 바깥쪽 반지름
    float radius2 = radius1 / 2;    // 안쪽 반지름
    int points = int(random(5, 5)); // 5~7개의 꼭짓점을 가진 별
    drawStar(starX[i], starY[i], radius1, radius2, points);
  }
  
  stroke(0);
  strokeWeight(3);
   // 커비 발
  fill(255, 80, 90); // 빨간색
  ellipse(270, 340, 78, 50); // 왼쪽 발
  ellipse(370, 340, 78, 50); // 오른쪽 발
  
  // 커비 몸체
  fill(255, 182, 193); // 분홍색
  ellipse(320, 240, 200, 200); // 커비의 둥근 몸

  // 커비 얼굴
  // 눈
  if (isBlinking) {
    fill(0); // 눈을 감은 상태
    ellipse(290, 210, 30, 10); // 왼쪽 눈 깜박임
    ellipse(350, 210, 30, 10); // 오른쪽 눈 깜박임
  } else{
  fill(0); // 검은색 눈 
  ellipse(290, 210, 30, 50); // 왼쪽 눈
  ellipse(350, 210, 30, 50); // 오른쪽 눈

  fill(255); // 흰색 하이라이트 
  ellipse(290, 200, 15, 23); // 왼쪽 눈 
  ellipse(350, 200, 15, 23); // 오른쪽 눈 

  fill(135, 206, 235); // 파란색 눈동자 
  ellipse(290, 225, 15, 15); // 왼쪽 눈 
  ellipse(350, 225, 15, 15); // 오른쪽 눈 
}
  
  // 커비 입
   fill(255, 105, 180); // 진한 분홍색 점 입
   ellipse(320, 250, 5, 5); // 점으로 표현된 입
 

  // 커비 뺨
  fill(255, 105, 150); // 진한 분홍색 
  ellipse(260, 240, 30, 20); // 왼쪽 뺨
  ellipse(380, 240, 30, 20); // 오른쪽 뺨

  // 커비 팔
  fill(255, 182, 193); // 분홍색 팔
  ellipse(220, 280, 60, 40); // 왼쪽 팔
  ellipse(420, 280, 60, 40); // 오른쪽 팔
}

void drawStar(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle / 2.0;
  
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius1;
    float sy = y + sin(a) * radius1;
    vertex(sx, sy);
    sx = x + cos(a + halfAngle) * radius2;
    sy = y + sin(a + halfAngle) * radius2;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed() {
  isBlinking = true; // 눈 깜박임 시작
}

void mouseReleased() {
  isBlinking = false; // 눈 깜박임 종료
}
