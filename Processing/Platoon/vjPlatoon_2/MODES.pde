
void drawingMode() {
  
  if(Mode == 1 ) {

  
  }

 // ----------------

  else if(Mode == 2) {
    background(b,gg,r);

 }

 // ----------------

 else if(Mode == 3) {

  float a = (r+gg+b)/3;
  // Draaw
  scale(2.0);
  background(0);
  stroke(r, gg, b, aa);
  strokeWeight(1);
  // Fill ?
  if(fillRect == true) {
    fill(r, gg, b, aa);
  }
  else if(fillRect == false) {
    noFill();
  }
  // Rotaate
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
 
 // ----------------
 
 else if(Mode == 4) {
  if(frameCount % res == 0) {
    background(0);
  }
  
    translate(width/2, height/2);
    scale((r+gg+b)/3/res);
    println("RES is " + res);
    for(int m = 0; m < in.bufferSize(); m++) {
      strokeWeight(m/res);
      rotateZ(HALF_PI/in.mix.get(m));
    }
    for(int r = 0; r < in.bufferSize()-1; r++) {
      rotateX(r/-1.5 + in.right.get(r));
      rotateX(-r/-1.5 + in.right.get(r));
    }
    for(int l = 0; l < in.bufferSize()-1; l++) {
      rotateY(l/-1.5 + in.left.get(l));
      rotateY(-l/-1.5 + in.left.get(l));
    }
  stroke(r, gg, b);
  for(int i = 0; i < invaders[imageArray].height/2; i+=res) {
    for(int j = 0; j < invaders[imageArray].width/2; j+=res) {
      pushMatrix();
        scale(1.0, 1.0, 0.0);
        point(i*1, j*+1, in.right.get(i));
      popMatrix();
      pushMatrix();
        scale(-1.0, 1.0, 0.0);
        point(i*1, j*+1, in.right.get(i));
      popMatrix();
      pushMatrix();
        scale(-1.0, -1.0, 0.0);
        point(i*1, j*+1, in.left.get(i));
      popMatrix();
      pushMatrix();
        scale(1.0, -1.0, 0.0);
        point(i*1, j*+1, in.left.get(i));
      popMatrix();
    }
  }
   
 }

 // ----------------

 else if(Mode == 5) {
  
  if(frameCount % 5 == 0) { 
    background(0);
  }
  
  float rgb = (r+gg+b)/3;
  int r_ = round(r);
  int g_ = round(gg);
  int b_ = round(b);
  //scale((r+g+b)/255);  
  
  textFont(bandText[fontArray], 32);
  textSize(rgb);
  textAlign(LEFT);
  
  //translaate(in.left.get(rgb_/25), in.right.get(rgb_/25), 0-in.mix.get(rgb_));
  
  rotateX(in.left.get(r_));
  rotateY(in.right.get(g_));
  rotateZ(in.mix.get(b_));
  fill(r, gg, b);
  text(bandName, width/4, height/4 + in.mix.get(r_));
  //text(bandNaame, width/2 + in.mix.get(rgb_), height/4 + in.mix.get(rgb_));

  

  fill(gg, b, r);
  text(bandName, width/4, height/2 + in.mix.get(g_)); 
  //text(bandName, width/4 + in.mix.get(rgb_), height/2);
  

  fill(b, r, gg);
  text(bandName, width/4, 3*(height/4) + in.mix.get(b_));
  //text(bandName, 3*(width/4) + in.mix.get(rgb_), 3*(height/4) + in.mix.get(rgb_)); 
  
 }

 // ----------------

 else if(Mode == 6) {
  
  scale(2.0);
  background(0);
  stroke(r, gg, b, aa);
  strokeWeight(1);
  sphereDetail(sd);
  
  // Fill ?
  if(fillRect == true) {
    fill(r, gg, b, aa);
  }
  else if(fillRect == false) {
    noFill();
  }
  float offset = ((width-in.bufferSize())/12);
  // Buffer
  for(int i = 0; i < in.bufferSize(); i++) {
    pushMatrix();
      translate(offset + i, height/4); 
      //pointLight();
      sphere(in.mix.get(i)*width);
    popMatrix();

  } 

 }

 // ----------------

 else if(Mode == 7) {
   int step = 20;
   if(frameCount % 15 == 0) { 
     background(0);
   }
   stroke(155, 5);
   strokeWeight(0.5);
   for(int i = 0; i < width; i += step) {
     line(0, i, width, i);
     line(i, 0, i, height);
   }
   fill(r, gg, b);
   for(int i = 0; i < in.bufferSize(); i++) {
      rect(step * i, height, step,  in.mix.get(i)*height);
  } 

 }

 // ----------------

 else if(Mode == 8) {
   int step = 20;

   //strokeJoin(ROUND);
   
    if(fillRect == true) {
      fill(r, gg, b);
      stroke(r, gg, b);
      strokeWeight(aa);
    }
    else if(fillRect == false) {
      noFill();
      stroke(r, gg, b);
      strokeWeight(aa);
    }

   if(beat.isKick()) {
     background(0);
     rect(random(width), random(height), step * in.mix.get(aa)*r, step *in.mix.get(aa)*r);
     rect(random(width), random(height), step * in.mix.get(aa)*gg, step *in.mix.get(aa)*gg);
     rect(random(width), random(height), step * in.mix.get(aa)*b, step *in.mix.get(aa)*b);
   }
   if(beat.isSnare()) {
     background(0);
     rect(random(width), random(height), step * in.mix.get(aa)*r, step *in.mix.get(aa)*r);
     rect(random(width), random(height), step * in.mix.get(aa)*gg, step *in.mix.get(aa)*gg);
     rect(random(width), random(height), step * in.mix.get(aa)*b, step *in.mix.get(aa)*b);     
   }
   if(beat.isHat()) {
     background(0);
     rect(random(width), random(height), step * in.mix.get(aa)*r, step *in.mix.get(aa)*r);
     rect(random(width), random(height), step * in.mix.get(aa)*gg, step *in.mix.get(aa)*gg);
     rect(random(width), random(height), step * in.mix.get(aa)*b, step *in.mix.get(aa)*b);
   }   

 }

 // ----------------

 else if(Mode == 9) {
  int step = 20;
  background(0);
  scale(1.5);
  strokeWeight(aa /step);
  rotateX(r/2);
   for(int i = 1; i < width; i += step) {
     stroke(in.mix.get(aa+100)*r+(step/i), in.mix.get(aa+100)*gg+(step/i), in.mix.get(aa+100)*b+(step/i));
     line(0, i, width, i);
     stroke(in.mix.get(aa+100)*gg+step, in.mix.get(aa+100)*b+step, in.mix.get(aa+100)*r+step);
     line(0, i + (step/2), width, i + (step/2));
   }

 }
 
}

//-------------

// Mode 2 Custom Functions

public void create_blur(PImage si) {
  for (int i=0; i<blurM.length; i++) {
    float blur_factor=max_blur*pow(i/blurM.length,2);  
    blurM[i]= new PImage(si.width,si.height,RGB);
    blurM[i].copy(si,0,0,si.width,si.height,0,0,si.width,si.height);  
    blurM[i].filter(BLUR,blur_factor);
  }
}


// Mode 4 Custom Functions
public void reInitImage() {
  a = invaders[imageArray];
  aPixels = new int[a.width][a.height];
  for(int i = 0; i < a.height; i += res) {
    for(int j = 0; j < a.width; j += res) {
      aPixels[j][i] = a.pixels[i*a.width+j];
    }
  }
}
