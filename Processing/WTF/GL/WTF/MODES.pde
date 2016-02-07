
void drawingMode() {
  
  if(Mode == 1 ) {

  canvas.background(r, g, b);
  opencv.read();
  PImage img = opencv.image();
  img.loadPixels();

  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      camColors[j * numPixels + i] = img.get(i, j);
      canvas.fill(camColors[j * numPixels + i]);
      canvas.rect(i * blockSize, j * blockSize, blockSize-1, blockSize-1);
    }
  }

    
  }
  //
  else if(Mode == 2) {

  opencv.read();
  opencv.convert(GRAY);
  Rectangle[] faces = opencv.detect(1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40);
    
  canvas.pushMatrix();
    canvas.scale(2.0);
    canvas.scale(-1,1);
    canvas.tint(r, g, b);
    //detectthread.display();
    canvas.image(opencv.image(), 0, 0);
  canvas.popMatrix(); 

  canvas.fill(r, g, b, 100);
  canvas.rect(0, 0, width, height);



//  Rectangle[] faces =  detectthread.getRectangles();
//
 for( int i = 0; i < faces.length; i++ ) {
    float fh = faces[i].height;
    float fw = faces[i].width;
    float xoffset = 0.92 * fw;
    float yoffset = 0.92 * fh;
    float xoffset2 = -0.1 * fw;    
    float yoffset2 = 0.35 * fh;
    float Iheight = factor * fh + 2 * xoffset;
    float Iwidth = factor * invaders[imageArray].width * fh / invaders[imageArray].height + 2 * yoffset;
    float fx = w + xoffset2 + xoffset - factor * faces[i].x - Iwidth; 
    float fy = - yoffset2 - yoffset + factor * faces[i].y + 0.0 * Iheight;
    float depth_factor = min(max(0, 0.6 * (invaders[imageArray].height / Iheight) -1.0) , 1);
    int tint_factor = int(240 - depth_factor * 60);
    int blur_idx = floor((max_blur_img - 1) * depth_factor);
    
    //println(faces.length);
    
    canvas.pushStyle();
      canvas.tint(r, g, b);
      canvas.scale(2.0);
      //canvas.image(blurM[blur_idx], fx,fy,Iwidth, Iheight);
      canvas.image(invaders[imageArray], fx, fy, Iwidth, Iheight);
    canvas.popStyle();
  }    
    
 }
 //
 else if(Mode == 3) {

  float a = (r+g+b)/3;
  // Draw
  canvas.scale(2.0);
  canvas.background(0);
  canvas.stroke(r, g, b, a);
  canvas.strokeWeight(1);
  // Fill ?
  if(fillRect == true) {
    canvas.fill(r, g, b, a);
  }
  else if(fillRect == false) {
    canvas.noFill();
  }
  // Rotate
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  // Buffer
  for(int i = 0; i < in.bufferSize() - 1; i++) {
    canvas.pushMatrix();
     canvas.translate(56 + i, height/4); 
     canvas.rotateX(-ymag); 
      canvas.rotateY(-xmag); 
     canvas.box(in.mix.get(i)*width/4, in.mix.get(i)*height, 25);
    canvas.popMatrix();

  } 
 }
 // 
 else if(Mode == 4) {
  if(frameCount % res == 0) {
    canvas.background(0);
  }
  
    canvas.translate(width/2, height/2);
    canvas. scale((r+g+b)/3/res);
    //println("RES is " + res);
    for(int m = 0; m < in.bufferSize(); m++) {
      canvas.strokeWeight(m/res);
      canvas.rotateZ(HALF_PI/in.mix.get(m));
    }
    for(int r = 0; r < in.bufferSize()-1; r++) {
     canvas. rotateX(r/-1.5 + in.right.get(r));
     canvas. rotateX(-r/-1.5 + in.right.get(r));
    }
    for(int l = 0; l < in.bufferSize()-1; l++) {
     canvas. rotateY(l/-1.5 + in.left.get(l));
      canvas.rotateY(-l/-1.5 + in.left.get(l));
    }
  canvas.stroke(r, g, b);
  for(int i = 0; i < invaders[imageArray].height/2; i+=res) {
    for(int j = 0; j < invaders[imageArray].width/2; j+=res) {
      canvas.pushMatrix();
      canvas.  scale(1.0, 1.0, 0.0);
      canvas.  point(i*1, j*+1, in.right.get(i));
      canvas.popMatrix();
      canvas.pushMatrix();
      canvas.  scale(-1.0, 1.0, 0.0);
      canvas.  point(i*1, j*+1, in.right.get(i));
      canvas.popMatrix();
      canvas.pushMatrix();
      canvas.scale(-1.0, -1.0, 0.0);
        canvas.point(i*1, j*+1, in.left.get(i));
     canvas.popMatrix();
      canvas.pushMatrix();
        canvas.scale(1.0, -1.0, 0.0);
        canvas.point(i*1, j*+1, in.left.get(i));
      canvas.popMatrix();
    }
  }
   
   
 }
 //
 else if(Mode == 5) {
  
  if(frameCount % 5 == 0) { 
    canvas.background(0);
  }
  
  float rgb = (r+g+b)/3;
  int rgb_ = round(rgb);

  canvas.scale((r+g+b)/255);  
  
  canvas.textFont(bandText[fontArray], 32);
  canvas.textSize(rgb);
  canvas.textAlign(CENTER);
  
  canvas.translate(in.left.get(rgb_), in.right.get(rgb_), 0-in.mix.get(rgb_));
  
  canvas.rotateX(in.left.get(rgb_));
  canvas.fill(r, g, b);
  canvas.text(bandName, width/2, height/4 + in.mix.get(rgb_));
  canvas.text(bandName, width/2 + in.mix.get(rgb_), height/4 + in.mix.get(rgb_));

  
  canvas.rotateY(in.right.get(rgb_));
  canvas.fill(g, b, r);
  canvas.text(bandName, width/2, height/2); 
  canvas.text(bandName, width/4 + in.mix.get(rgb_), height/2);
  
  canvas.rotateZ(in.mix.get(rgb_));
  canvas.fill(b, r, g);
  canvas.text(bandName, width/2, 3*(height/4) + in.mix.get(rgb_));
  canvas.text(bandName, 3*(width/4) + in.mix.get(rgb_), 3*(height/4) + in.mix.get(rgb_)); 
 }
 //
 else if(Mode == 6) {
  
  float a = (r+g+b)/3;
  canvas.scale(2.0);
  canvas.background(0);
  canvas.stroke(r, g, b, a);
  canvas.strokeWeight(1);
  canvas.sphereDetail(sd);
  
  // Fill ?
  if(fillRect == true) {
    canvas.fill(r, g, b, a);
  }
  else if(fillRect == false) {
    canvas.noFill();
  }
  
  // Buffer
  for(int i = 0; i < in.bufferSize(); i++) {
    canvas.pushMatrix();
      canvas.translate(56 + i, height/4); 
      canvas.sphere(in.mix.get(i)*width);
    canvas.popMatrix();

  } 
 }

}

//-------------

// Mode 2 Custom Functions

public void create_blur(PImage si) {
  for (int i=0; i<blurM.length; i++) {
    float blur_factor=max_blur*pow(i/blurM.length,2);  
    blurM[i]= new PImage(si.width,si.height,ARGB);
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
