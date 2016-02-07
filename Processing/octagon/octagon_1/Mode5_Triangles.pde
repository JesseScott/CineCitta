
// Function

void mode5_Triangles() {
  pushStyle();
  pushMatrix();
  
  defineLights();
  ambientLight(br, bg, bb);
  
  if(basic) {
    noFill();
    for(int i = 0; i < numTri; i += 4) {
      if(beat.isKick()) {
        stroke(br +ba, bg/2, bb/2, 100 +ba);
        triangle(0, height, width/2 + random(-br, br), height/2 + random(-br, br), width, height); 
      }
      if(beat.isSnare()) {
        stroke(br/2, bg +ba, bb/2, 100 +ba);
        triangle(0, height, width/2 + random(-bg, bg), height/2 + random(-br, br), width, height); 
      }
      if(beat.isHat()) {
        stroke(br/2, bg/2, bb +ba, 100 +ba);
        triangle(0, height, width/2 + random(-bb, bb), height/2 + random(-br, br), width, height); 
      }
    }

  }
  else {
    if(beat.isKick()) {
      translate(0 -width/4, 0 -height/4);
      scale(1.5);
    }
    for(int i = 0; i < numTri; i++) {
      if(beat.isHat() || beat.isSnare() ) {
        strokeWeight(4);
        float place = height/2 + random(-bb, bb);
        stroke(br + i, bg - i, bb, 255 -ba);
        triangle(ba, height/2, width/2, place, width -ba, height/2); 
      }
    } 
  }

  ang++;
  popMatrix();
  popStyle(); 
}
// END


