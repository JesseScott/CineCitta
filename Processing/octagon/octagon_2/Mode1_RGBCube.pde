
// Function

void mode1_RGBCube() {
  noStroke();
  // 1
  pushMatrix(); 
    translate(width/6, height/2, -30); 
    newXmagR = br/float(width) * TWO_PI;
    newYmagR = -br/float(height) * TWO_PI;
    
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
  
  //2
  pushMatrix(); 
    translate(width/2, height/2, -30); 
    newXmagG = bg/float(width) * TWO_PI;
    newYmagG = -bg/float(height) * TWO_PI;
    
    float diffG = xmagG-newXmagG;
    if (abs(diffG) >  0.01) { xmagG -= diffG/4.0; }
    
    diffG = ymagG-newYmagG;
    if (abs(diffG) >  0.01) { ymagG -= diffG/4.0; }
    
    rotateX(-ymagG); 
    rotateY(-xmagG); 
  
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
  
 //3
  pushMatrix(); 
    translate(width-(width/6), height/2, -30); 
    newXmagB = bb/float(width) * TWO_PI;
    newYmagB = -bb/float(height) * TWO_PI;
    
    float diffB = xmagB-newXmagB;
    if (abs(diffB) >  0.01) { xmagB -= diffB/4.0; }
    
    diffG = ymagB-newYmagB;
    if (abs(diffB) >  0.01) { ymagB -= diffB/4.0; }
    
    rotateX(-ymagB); 
    rotateY(-xmagB); 
  
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

// END
