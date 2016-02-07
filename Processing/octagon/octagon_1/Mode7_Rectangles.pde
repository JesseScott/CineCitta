
// Function

void mode7_Rectangles() {
  pushStyle();
  pushMatrix();
  rectMode(CENTER);
  
  if(basic) {
    translate(width/2, height/2);
    if(beat.isKick()) {
      scale(1.5);
      stroke(br*2, bg*2, bb*2);
      noFill();
      //fill(br + ba, bg + ba, bb +ba, br);
      for(int i = 0; i < numRect; i++) {
        rect(0, 0, br + bg +bb + ba, numRect/2 - ba - i); 
      }
    }
    if(beat.isSnare()) {
      scale(1.0); 
    }
    if(beat.isHat()) {
      scale(0.5);
      stroke(br*2, bg*2, bb*2);
      noFill();
      //fill(br + ba, bg + ba, bb + ba, bb);
      for(int i = 0; i < numRect; i++) {
        rect(0, 0, numRect/2 - ba - i, br + bg + bb + ba); 
      }
    }
  }
  else {
    pushMatrix();
    translate(0, height/3);
    if(beat.isSnare() || beat.isHat()) {
      noFill();
      stroke(br+ba, bg+ba, bb+ba, 200 -ba);
      for(int i = 0; i < numRect; i++) {
        strokeWeight(i);
        rect(width/2 -random(-br, br), br, width/2 +random(-ba, ba) +i, random(ba * 2) );
        //rect(width/2 -random(-bg, bg), bg, width/2 +random(-ba, ba) +i, random(ba) );
        //rect(width/2 -random(-bb, bb), bb, width/2 +random(-ba, ba) +i, random(ba) );
      }
    }
    popMatrix();
  }
  

  
  
  popMatrix();
  popStyle();
}
// END

