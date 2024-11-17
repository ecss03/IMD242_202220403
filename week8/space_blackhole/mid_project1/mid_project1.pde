import java.util.ArrayList;

ArrayList<Light> lights; // 빛 리스트
BlackHole blackHole; // 블랙홀
boolean isDragging = false; // 드래그 상태 추적

void setup() {
  fullScreen(); // 전체화면 실행 
  lights = new ArrayList<Light>();
  
  // 빛 여러 개 생성
  spawnLights();
  blackHole = new BlackHole(width / 2, height / 2);
}

void draw() {
  background(0); // 우주 배경
  
  // ArrayList 크기 화면 좌측 상단에 표시하도록 설정 
  fill(255);
  textSize(20);
  text("Lights: " + lights.size(), 20, 30);
  
  // (AI 생성) 빛 처리 방법 요청   
  for (int i = lights.size() - 1; i >= 0; i--) {
    Light l = lights.get(i); // lights 리스트에서 i번째 빛 객체를 가져와 변수 l에 저장함 
    l.move(); // 빛의 위치를 이동시키고 블랙홀을 향해 조금씩 끌어당김
    l.display();  // 빛을 화면에 표시
    
    if (l.isOutOfScreen()) {
      lights.remove(i); // 빛을 리스트에서 제거
      continue; // 계속해서 다음 빛으로 넘어감
    }
    
    if (blackHole.attracts(l)) {
      l.pullTowards(blackHole.x, blackHole.y, blackHole.getAttractionForce(l));// 빛을 블랙홀로 끌어당기기
      
      if (blackHole.absorbs(l)) {
        lights.remove(i); // 빛을 리스트에서 제거
      }
    }
  }
  
  if (lights.isEmpty()) {
    spawnLights();
    blackHole.setPosition(width / 2, height / 2);
  }
  
  blackHole.display();
}

void mousePressed() {
  isDragging = true;
  lights.add(new Light(mouseX, mouseY));
}

void mouseDragged() {
  if (isDragging) {
    lights.add(new Light(mouseX, mouseY));
  }
}

void mouseReleased() {
  isDragging = false;
}

// 빛 생성 개수  
void spawnLights() {
  int numLights = int(width * height * 0.00001);
  for (int i = 0; i < numLights; i++) {
    lights.add(new Light(random(width), random(height)));
  }
}
