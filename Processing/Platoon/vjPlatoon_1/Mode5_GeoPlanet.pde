
// Function

void mode5_GeoPlanet() {
  pushMatrix();
  int index=0;
  translate(width/2, height/2, 0);
  rotateX(PI/3);
  rotateY(PI/6);
 
  for (int i = 0; i < num; i++) {
    pushMatrix();
      rotateX(pt[index++]);
      rotateY(pt[index++]);
      scale(20 * in.mix.get(in.bufferSize()-1));
      if(style[i*2+1]==0) {
        stroke(br, 0, 0, br);
        noFill();
        strokeWeight(1);
        arcLine(0,0, pt[index++],pt[index++],pt[index++]);
      }
      else if(style[i*2+1]==1) {
        //canvas.fill(style[i*2]);
        fill(0, bg, 0, bg);
        noStroke();
        arcLineBars(0,0, pt[index++],pt[index++],pt[index++]);
      }
      else {
        //canvas.fill(style[i*2]);
        fill(0, 0, bb, bb);
        noStroke();
        arc(0,0, pt[index++],pt[index++],pt[index++]);
      }
   
      // increase rotation
      pt[index-5]+=pt[index]/10;
      pt[index-4]+=pt[index++]/20;
    popMatrix();
  }
  popMatrix();
  
}

// colorBlended()
int colorBlended(float fract,
float r, float g, float b,
float r2, float g2, float b2, float a) {
 
  r2 = (r2 - r);
  g2 = (g2 - g);
  b2 = (b2 - b);
  return color(r + r2 * fract, g + g2 * fract, b + b2 * fract, a);
}
 
// Draw arc line
void arcLine(float x,float y,float deg,float rad,float w) {
  int a=(int)(min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1));
  int numlines=(int)(w/2);
 
  for (int j=0; j<numlines; j++) {
    beginShape();
    for (int i=0; i<a; i++) { 
      vertex(cosLUT[i]*rad+x,sinLUT[i]*rad+y);
    }
    endShape();
    rad += 2;
  }
}
 
// Draw arc line with bars
void arcLineBars(float x,float y,float deg,float rad,float w) {
  int a = int((min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1)));
  a /= 4;
 
  beginShape(QUADS);
  for (int i=0; i<a; i+=4) {
    vertex(cosLUT[i]*(rad)+x,sinLUT[i]*(rad)+y);
    vertex(cosLUT[i]*(rad+w)+x,sinLUT[i]*(rad+w)+y);
    vertex(cosLUT[i+2]*(rad+w)+x,sinLUT[i+2]*(rad+w)+y);
    vertex(cosLUT[i+2]*(rad)+x,sinLUT[i+2]*(rad)+y);
  }
  endShape();
}
 
// Draw solid arc
void arc(float x,float y,float deg,float rad,float w) {
  int a = int(min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1));
  beginShape(QUAD_STRIP);
  for (int i = 0; i < a; i++) {
    vertex(cosLUT[i]*(rad)+x,sinLUT[i]*(rad)+y);
    vertex(cosLUT[i]*(rad+w)+x,sinLUT[i]*(rad+w)+y);
  }
  endShape();
}

// END


