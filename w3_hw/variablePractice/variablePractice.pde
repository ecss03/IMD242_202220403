ArrayList<CircleParticle> circles = new ArrayList<CircleParticle>();

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);
  
  // 모든 원 파티클 업데이트 및 표시
  for (CircleParticle c : circles) {
    c.update();
    c.display();
  }
}

void mousePressed() {
  // 마우스 클릭 시 새로운 원 파티클 시스템 추가
  for (int i = 0; i < 20; i++) {  // 각 클릭마다 여러 원 파티클 생성
    float x = random(width);
    float y = random(height);
    float size = random(5, 70); // 원 크기 크게 설정
    circles.add(new CircleParticle(x, y, size, randomPinkColor()));
  }
}

// 원 파티클 클래스 정의
class CircleParticle {
  float x, y, size;
  color c;
  float lifespan = 255;
  
  CircleParticle(float x, float y, float size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  void update() {
    y += random(-5, 0.5); // 부드럽게 흔들리며 움직임
    x += random(-5, 0.5);
    lifespan -= 2; // 원이 서서히 사라짐
  }
  
  void display() {
    fill(c, lifespan); // 투명도를 적용하여 서서히 사라짐
    noStroke();
    ellipse(x, y, size, size); // 원 그리기
  }
}

// 랜덤 핑크 색상 생성 함수
color randomPinkColor() {
  float r = random(200, 255);  // 붉은 계열 강조
  float g = random(100, 130);  // 연한 녹색 (핑크 계열로 만들기 위해)
  float b = random(200, 250);  // 파란색을 약간 포함
  return color(r, g, b);
}
