PFont ccFont;

void setup() {
 size(screenWidth, screenHeight);
 ccFont = loadFont("CenturyGothic-48.vlw");
 textFont(ccFont, 192);
 textAlign(CENTER);
 smooth();
}

void draw() {
  background(255);
  fill(0);
  text("CineCitta", width/2, height/2);
  for(int i = 1; i < 15; i++) {
    line(width/4, height/i, 3*(width/4), height/i );  
  }
  
}

void keyPressed() {
 saveFrame("save.tiff"); 
  
}
