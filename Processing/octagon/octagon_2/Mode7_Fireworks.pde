
// Function

void mode7_Fireworks() {
  scale(2.0);
  background(0);
  strokeWeight(1);
  stroke(br, bg, bb);
  if(fillRect == true) {
    fill(br, bg, bb, ba);
  }
  else if(fillRect == false) {
    noFill();
  }

  // Rotaate
  noCursor();
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  float offset = ((width-in.bufferSize())/12);
  // Buffer
  for(int i = 0; i < in.bufferSize() - 1; i++) {
    pushMatrix();
      translate(offset + i, height/4); 
      rotateX(-ymag); 
      rotateY(-xmag); 
      box(in.mix.get(i)*width/4, in.mix.get(i)*height, 25);
    popMatrix();
  }  
  
}

// END

