// 빛 클래스
class Light {
  float x, y;
  float size = random(3, 18); // 빛 크기
  float speedX, speedY;
  float slowAttractionForce = 0.8; // 끌림의 힘 
  int brightness = 255; // 빛의 밝기
  
  // 새로운 빛 객체를 생성 
  Light(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = random(-2, 2);
    speedY = random(-2, 2);
  }
  
  void move() {
    x += speedX;
    y += speedY;
    
    // (AI 생성) 블랙홀을 향해 끌리도록 요청함 
    float angle = atan2(blackHole.y - y, blackHole.x - x);
    x += cos(angle) * slowAttractionForce;
    y += sin(angle) * slowAttractionForce;
    
    // 화면 경계에서 반사
    if (x < 0 || x > width) speedX *= -1;
    if (y < 0 || y > height) speedY *= -1;
  }
  // (AI 생성) 블랙홀에 가까워질수록 빛이 희미해지도록 요청함 
  void pullTowards(float targetX, float targetY, float force) {
    float angle = atan2(targetY - y, targetX - x);
    x += cos(angle) * force;
    y += sin(angle) * force;
    brightness = max(0, brightness - 3);
  }
  
  void display() {
    fill(brightness, brightness, 255, brightness); // 푸른빛 효과
    noStroke();
    ellipse(x, y, size, size);
  }
  
  // 빛이 화면 밖으로 나갔는지 확인하는 함수 
  boolean isOutOfScreen() {
    return x < -size || x > width + size || y < -size || y > height + size;
  }
}
