void setup() {
  size(800, 800); 
}

void draw() {
  background(0);
  translate(width / 2, height / 2);  // 중심을 화면 중앙으로 이동
  rotate(-HALF_PI);  // 시계가 원래 12시 방향부터 시작하게 회전 

  // 시계 내부
  fill(255);
  noStroke();
  ellipse(0, 0, 600, 600);

  // 시계 내부
  fill(255);
  stroke(255, 0, 0, 100);
  strokeWeight(2);
  ellipse(0, 0, 590, 590);

  // 시계 테두리 그리기
  strokeWeight(2);
  for (int i = 0; i < 60; i++) {
    if (i % 5 == 0) {
      stroke(0);  
      strokeWeight(2);
      line(300, 0, 270, 0);  // 긴 마커
    } else {
      stroke(100); 
      line(300, 0, 290, 0);  // 짧은 마커
    }
    rotate(TWO_PI / 60);
  }

  // 시간, 분, 초 정보
  int hr = hour();
  int mn = minute();
  int sc = second();

  // 초침 그리기
  stroke(255, 0, 0); 
  strokeWeight(3);
  float secondAngle = map(sc, 0, 60, 0, TWO_PI); 
  line(0, 0, 250 * cos(secondAngle), 250 * sin(secondAngle));

  // 분침 그리기
  stroke(0);  // 검정색
  strokeWeight(4);
  float minuteAngle = map(mn, 0, 60, 0, TWO_PI);  
  line(0, 0, 200 * cos(minuteAngle), 200 * sin(minuteAngle));

  // 시침 그리기
  strokeWeight(6);
  float hourAngle = map(hr % 12, 0, 12, 0, TWO_PI); 
  line(0, 0, 150 * cos(hourAngle + minuteAngle / 12), 150 * sin(hourAngle + minuteAngle / 12));  // 분에 따른 시간 보정

  // 시계 중심점
  stroke(255, 0, 0);
  fill(255, 0, 0);
  ellipse(0, 0, 20, 20); 
}
