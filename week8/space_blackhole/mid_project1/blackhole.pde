class BlackHole {
  float x, y;
  float size = 70; // 블랙홀 크기 
  float attractionRange = 500; // 빛을 끌어당기는 범위
  float angle = 0; // 블랙홀의 움직임을 위한 각도
  
  // 블랙홀의 위치를 설정 
  BlackHole(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // (AI 생성) 블랙홀과 빛의 끌어당김의 정도와 흡수가 가능한지 판단하기 위한 함수를 요청 
  // 블랙홀과 빛의 거리가 attractionRange보다 작은지 확인
  boolean attracts(Light l) {
    return dist(x, y, l.x, l.y) < attractionRange;
  }
  
  float getAttractionForce(Light l) {
    float d = dist(x, y, l.x, l.y);
    return max(2, map(d, 0, attractionRange, 8, 2));
  }
  
  boolean absorbs(Light l) {
    return dist(x, y, l.x, l.y) < size / 2 + l.size / 2;
  }
  
  void display() {
    // (AI 생성) 블랙홀의 지글지글한 빛나는 효과 내는 법을 요청함 
    float sparkleSize = sin(frameCount * 0.1) * 15 + 10; // 지글지글한 크기 변화
    for (int i = 5; i > 0; i--) {
      fill(255, 255, 255, 50 - i * 10 + sparkleSize); // 불투명도 변화
      ellipse(x, y, size + i * 15, size + i * 15);
    }
    
    // 블랙홀 본체
    fill(0);
    ellipse(x, y, size, size);
    
    // 블랙홀의 원 운동 움직임 
    x = width / 2 + cos(angle) * 150; // 원형 경로를 따라 움직임
    y = height / 2 + sin(angle) * 150;
    angle += 0.018; // 움직임 속도
  }
}
