
// Function

void mode8_Lines() {
  pushStyle();
  pushMatrix();
  
  if(basic) {  
    if(beat.isKick()) {
      translate(0 -width/2,0);
      scale(2.0);
    }
    if(beat.isHat() || beat.isSnare()) {
      for(int i = 0; i < numLines; i++) {
        stroke(br +ba, bg - ((i/2) +ba), bb - ((i/2) +ba), 300 -ba);
        strokeWeight(i/4 - ba/2);
        float place = height/2 + random(-bb, bb);
        line(255 -ba, place, width -(255-ba), place);
      }
    }
  }
  else {
    strokeWeight(2);
    translate(0,0);
    if(beat.isKick()) scale(2,0);
    if(beat.isHat() || beat.isSnare()) {
      for(int i = 0; i < numLines; i++) {
        float place = width/2 + random(-bb, bb);
        stroke(br + i, bg - i, bb, 300 -ba);
        line(place, 0, place, height ); 
      }
    } 
  }
  
  popMatrix();
  popStyle(); 
}
//END
