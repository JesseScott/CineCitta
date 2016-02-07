
// Function

void mode3_LightsGL() {
  pushStyle();
  pushMatrix();

  
  defineLights();
  translate(width/8, height/8);
  
  if(basic) {
    canvas.stroke(br, bg, bb, ba);
  }
  else{
    scale(2.0);
    canvas.noStroke();
  }
  
  for (int x = 0; x <= width; x += 100) {
    for (int y = 0; y <= height; y += 100) {
      canvas.pushMatrix();
        canvas.translate(x, y);
            rotateX(PI/frameCount);  
            rotateY(radians(-ba));
        canvas.box(90);
      canvas.popMatrix();
    }
  }
  popMatrix();
  popStyle();
}
// END
