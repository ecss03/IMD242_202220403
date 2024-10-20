int randomSeedValue = int(random(10000));

void setup() {
  size(800, 800);
  noLoop(); 
}

void mousePressed() {
  randomSeedValue = int(random(10000));
  redraw();
}

void draw() {
  randomSeed(randomSeedValue);
  drawSunsetBackground(); 
  drawSun();               

  for (int n = 0; n < 7; n++) {
    float x = random(0.1 * width, 0.9 * width);
    float w = random(80, 150);
    float h = random(100, 200);
    float y = height - h / 2 - 50;  
    drawRandomHouse(x, y, w, h);
  }

  drawRoad();
}

// 노을 배경 
void drawSunsetBackground() {
  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(color(255, 102, 102), color(102, 51, 153), inter); 
    stroke(c);
    line(0, i, width, i);
  }
}

// 붉은 해 
void drawSun() {
  fill(255, 69, 0); 
  noStroke();
  ellipse(width * 0.8, height * 0.3, 100, 100);
}

// 랜덤 집
void drawRandomHouse(float x, float y, float w, float h) {
  int houseType = int(random(2));  
  color houseColor = color(random(100, 255), random(100, 255), random(100, 255));
  color darkRoofColor = color(red(houseColor) * 0.7, green(houseColor) * 0.7, blue(houseColor) * 0.7);  
  color doorColor = color(random(100, 255), random(100, 255), random(100, 255));
  color windowColor = color(random(130, 170), random(200, 240), random(200, 255));  

  // 집 몸체
  fill(houseColor);
  noStroke();
  rectMode(CENTER);
  rect(x, y, w, h);

  // 지붕 
  if (houseType == 0) {
    // 삼각형 지붕
    fill(darkRoofColor);
    float roofHeight = h / 3;
    triangle(x - w / 2, y - h / 2, x + w / 2, y - h / 2, x, y - h / 2 - roofHeight);
    
    // 문 
    fill(doorColor);
    float doorWidth = w / random(5, 8);
    float doorHeight = h / 4;
    float doorXOffset = random(-w / 4, w / 4); 
    rect(x + doorXOffset, y + h / 2 - doorHeight / 2, doorWidth, doorHeight); 
  } else {
    fill(darkRoofColor);
    rect(x, y - h / 2 - h / 6, w, h / 6);
  }

  // 창문 
  if (houseType == 0) {
    int windowCount = int(random(1, 3));
    for (int i = 0; i < windowCount; i++) {
      drawWindow(x, y, w, h, windowColor);  
    }
  } else {
    drawApartmentWindows(x, y, w, h, windowColor);
  }
}

// 집 창문 
void drawWindow(float x, float y, float w, float h, color windowColor) {
  fill(windowColor);
  float windowSizeW = w / random(5, 8);
  float windowSizeH = windowSizeW * random(1, 1.5);  
  float windowXOffset = random(-w / 3, w / 3);  
  float windowYOffset = random(-h / 4, h / 4);
  rect(x + windowXOffset, y + windowYOffset, windowSizeW, windowSizeH);
}

// 아파트 창문
void drawApartmentWindows(float x, float y, float w, float h, color windowColor) {
  float windowSizeW = w / 4;
  float windowSizeH = h / 6;
  float xOffsetStart = x - w / 3; 
  float yOffsetStart = y - h / 4; 
  
  fill(windowColor);
  for (int row = 0; row < 3; row++) {  
    for (int col = 0; col < 3; col++) { 
      float xOffset = xOffsetStart + col * (windowSizeW + w / 12); 
      float yOffset = yOffsetStart + row * (windowSizeH + h / 15);
      rect(xOffset, yOffset, windowSizeW, windowSizeH);
    }
  }
}

// 길 
void drawRoad() {
  fill(25, 25, 60);
  noStroke();
  rect(0, 780, 10000, 60);
}
