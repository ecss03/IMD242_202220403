int[] fruitAmt = new int[5];
String[] fruitNames = {"Mango", "Strawberry", "Kiwi", "Plum", "Banana"};
color[] baseFruitColors = {color(255, 193, 7), color(255, 87, 34), color(139, 195, 74), color(156, 39, 176), color(255, 235, 59)};
color[] fruitColors = new color[5];

void setup() {
  size(1280, 720);

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    fruitAmt[idx] = int(random(5, 100));
  }

  textAlign(CENTER);
  textSize(12);
}

void draw() {
  background(25, 25, 60);

  float totalWidth = width * 0.35; 
  float barWidth = totalWidth / (fruitAmt.length * 1.5); 
  float graphGap = 130; 
  float maxBarHeight = height * 0.4;  
  float offsetX = (width - (barWidth + graphGap) * fruitAmt.length + graphGap) / 1.7; 

  // 막대 색상을 과일에 맞게 설정
  for (int idx = 0; idx < fruitColors.length; idx++) {
    fruitColors[idx] = color(red(baseFruitColors[idx]) + random(-70, 70), 
                             green(baseFruitColors[idx]) + random(-70, 70), 
                             blue(baseFruitColors[idx]) + random(-70, 70));
  }

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    float x = offsetX + idx * (barWidth + graphGap);  
    float barHeight = map(fruitAmt[idx], 0, 150, 0, maxBarHeight);  

    // 막대 색상 설정
    fill(fruitColors[idx]);
    noStroke();
    rect(x - barWidth / 2, height * 0.6 - barHeight, barWidth, barHeight);

    // 막대 테두리
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(x - barWidth / 2, height * 0.6 - maxBarHeight, barWidth, maxBarHeight); 

    // 과일 이름과 수량 텍스트 표시
    fill(baseFruitColors[idx]);
    textSize(25);
    text(fruitNames[idx], x, height * 0.6 + 40); 
    fill(255);
    textSize(17);
    text("qty: " + fruitAmt[idx], x, height * 0.6 + 64);  
  }

  // 하단 텍스트 
  textSize(15);
  fill(255);
  text("FRUIT INVENTORY", 200, height - 20);
  text("CTRL + ALT + DELI", width / 2, height - 20);
  text("EST. 2001", width - 200, height - 20);
}
