 
// Function

void mode6_Circles() {
  pushStyle();
  pushMatrix();
  
  ellipseMode(CENTER);
  noFill();
  ambientLight(br -ba, bg -ba, bb -ba);
  
  if(basic) {
    translate(width/4, 0);
    for(int i = 0; i < numCircle; i++) {
      strokeWeight(i/32);
      pushMatrix();
        if(beat.isKick()) {
          translate(0,0,2);
          stroke(br+i, bg, bb, 355 - (ba +i));
          ellipse(0, height/2, i + br *kickSize, i + br *kickSize);
        }
      popMatrix(); 
      pushMatrix();
        if(beat.isSnare()) {
          translate(0,0,2);
          stroke(br, bg+i, bb, 355 - (ba +i));
          ellipse(width/4, height/2, i + bg *snareSize, i + bg *snareSize);
        }
      popMatrix();
      pushMatrix();
        if(beat.isHat()) {
          translate(0,0,2);
          stroke(br, bg, bb+i, 355 - (ba +i));
          ellipse(width/2, height/2, i + bb *hatSize, i + bb *hatSize);
        }
      popMatrix();
    }
  }
  else {
    noFill();
    translate(width/4, height/4);
    for(int i = 0; i < numCircle; i++) {
      strokeWeight(i/32);
      if(beat.isKick()) {
        stroke(255, 200 - (i + ba));
        ellipse(width/4, height/4, i - br, 400 - (i - br));
      }
      if(beat.isSnare()) {
        stroke(205, 200 - (i + ba));
        ellipse(width/4, height/4, i + bg, 300 - (i + bg));
      }
      if(beat.isHat()) {
        stroke(155, 200 - (i + ba));
        ellipse(width/4, height/4, i + bb, 350 - (i - bb));
      }
    }
  }
  
  popMatrix();
  popStyle();
}
 // END
