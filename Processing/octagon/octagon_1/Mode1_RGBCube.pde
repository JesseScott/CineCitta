
// Function

void mode1_RGBCube() {
  pushStyle();
  pushMatrix();
  
  noStroke();
  defineLights();
  
  for(int i = 1; i < numCubes; i++) {   
    pushMatrix(); 
      if(basic) {
        translate(width/10 * i, height/2, -30); 
      }
      else {
        translate(width/2, height/2); 
        scale(1.0 + ba);
      }
      
      newXmagR = br/float(i) * TWO_PI;
      newYmagR = -br/float(i) * TWO_PI;
      
      float diffR = xmagR-newXmagR;
      if (abs(diffR) >  0.01) { xmagR -= diffR/4.0; }
      
      diffR = ymagR-newYmagR;
      if (abs(diffR) >  0.01) { ymagR -= diffR/4.0; }
      
      rotateX(-ymagR); 
      rotateY(-xmagR); 
    
      scale(45);
      beginShape(QUADS);
      fill(0, bg, bb); vertex(-1,  1,  1);
      fill(br, bg, bb); vertex( 1,  1,  1);
      fill(br, 0, bb); vertex( 1, -1,  1);
      fill(0, 0, bb); vertex(-1, -1,  1);
    
      fill(br, bg, bb); vertex( 1,  1,  1);
      fill(br, bg, 0); vertex( 1,  1, -1);
      fill(br, 0, 0); vertex( 1, -1, -1);
      fill(br, 0, bb); vertex( 1, -1,  1);
    
      fill(br, bg, 0); vertex( 1,  1, -1);
      fill(0, bg, 0); vertex(-1,  1, -1);
      fill(0, 0, 0); vertex(-1, -1, -1);
      fill(br, 0, 0); vertex( 1, -1, -1);
    
      fill(0, bg, 0); vertex(-1,  1, -1);
      fill(0, bg, bb); vertex(-1,  1,  1);
      fill(0, 0, bb); vertex(-1, -1,  1);
      fill(0, 0, 0); vertex(-1, -1, -1);
    
      fill(0, bg, 0); vertex(-1,  1, -1);
      fill(br, bg, 0); vertex( 1,  1, -1);
      fill(br, bg, bb); vertex( 1,  1,  1);
      fill(0, bg, bb); vertex(-1,  1,  1);
    
      fill(0, 0, 0); vertex(-1, -1, -1);
      fill(br, 0, 0); vertex( 1, -1, -1);
      fill(br, 0, bb); vertex( 1, -1,  1);
      fill(0, 0, bb); vertex(-1, -1,  1);
      endShape();
    popMatrix(); 
  }
  
  popMatrix();
  popStyle();
}

// END
