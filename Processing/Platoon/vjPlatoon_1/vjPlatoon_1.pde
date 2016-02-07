
// IMPORTS

import codeanticode.syphon.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

// DECLARATIONS

PGraphics canvas;
//SyphonServer syphon;

Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;

// VARIABLES
float br,bg,bb;
int ba;
int count = 0;

int mode = 1;

//1
float xmagR, ymagR = 0;
float xmagG, ymagG = 0;
float xmagB, ymagB = 0;
float newXmagR, newYmagR = 0; 
float newXmagG, newYmagG = 0; 
float newXmagB, newYmagB = 0;  

//2
Icosahedron ico1;
Icosahedron ico2;
Icosahedron ico3;

//3

//4
float ang; // Used for oveall rotation
int limit = 500; // Cube count-lower/raise to test P3D/OPENGL performance
Cube[]cubes = new Cube[limit]; // Array for all cubes

//5
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION=2.0;
int SINCOS_LENGTH= int((360.0/SINCOS_PRECISION));
int num;
float pt[];
int style[];  

//6
int cuantos = 3000;
pelo[] lista ;
float[] z = new float[cuantos]; 
float[] phi = new float[cuantos]; 
float[] largos = new float[cuantos]; 
float radio = 200;
float rx = 0;
float ry =0;

//7 8

float r = 255;
float gg = 255;
float b = 255;
int aa = 0;
boolean fillRect = false;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int sd = 4;

// -------

void setup() {
  //screen
  size(1920, 1200, P3D);
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  canvas = createGraphics(width, height, P3D);  
  //syphon = new SyphonServer(this);
  
  //minim
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(100);
  bl = new BeatListener(beat, in);   
  
  //1 RGB Cube
  
  //2 Icosahedra
  ico1 = new Icosahedron(75);
  ico2 = new Icosahedron(75);
  ico3 = new Icosahedron(75);

  //3 Lights GL
  
  //4 Space Junk
  for (int i = 0; i< cubes.length; i++){
    cubes[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
    int(random(-10, 10)), int(random(-140, 140)), int(random(-140, 140)), 
    int(random(-140, 140)));
  }
  
  //5 Geo
  sinLUT=new float[SINCOS_LENGTH];
  cosLUT=new float[SINCOS_LENGTH];
  for (int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i]= (float)Math.sin(i*DEG_TO_RAD*SINCOS_PRECISION);
    cosLUT[i]= (float)Math.cos(i*DEG_TO_RAD*SINCOS_PRECISION);
  }
  num = 150;
  pt = new float[6*num]; // rotx, roty, deg, rad, w, speed
  style = new int[2*num]; // color, render style
  int index=0;
  float prob;
  for (int i=0; i<num; i++) {
    pt[index++] = random(PI*2); // Random X axis rotation
    pt[index++] = random(PI*2); // Random Y axis rotation
    pt[index++] = random(60,80); // Short to quarter-circle arcs
    if(random(100)>90) pt[index]=(int)random(8,27)*10;
    pt[index++] = int(random(2,50)*5); // Radius. Space them out nicely
    pt[index++] = random(4,32); // Width of band
    if(random(100)>90) pt[index]=random(40,60); // Width of band
    pt[index++] = radians(random(5,30))/5; // Speed of rotation
    prob = random(100);
    if(prob<30) style[i*2]=colorBlended(random(1), 255,0,100, 255,0,0, 210);
    else if(prob<70) style[i*2]=colorBlended(random(1), 0,153,255, 170,225,255, 210);
    else if(prob<90) style[i*2]=colorBlended(random(1), 200,255,0, 150,255,0, 210);
    else style[i*2]=color(255,255,255, 220);
    if(prob<50) style[i*2]=colorBlended(random(1), 200,255,0, 50,120,0, 210);
    else if(prob<90) style[i*2]=colorBlended(random(1), 255,100,0, 255,255,0, 210);
    else style[i*2]=color(255,255,255, 220);
    style[i*2+1]=(int)(random(100))%3;
  }
  
  //6 Esfera
  radio = height/3.5;
  lista = new pelo[cuantos];
  for (int i=0; i<cuantos; i++){
    lista[i] = new pelo();
  }
  noiseDetail(3);
  
  //7 Fireworks
  
  //8 Smoke


}

// -------
/*
void enableVSync() {
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  javax.media.opengl.GL gl = pgl.beginGL();
  gl.setSwapInterval(1);
  pgl.endGL();
}
*/
// ------

void draw() {
  frameRate(60);
//  enableVSync();
  analyzeSound();
  background(0);
  canvas.beginDraw();
    canvas.background(0);
    drawMode();
  canvas.endDraw();
  image(canvas, 0, 0);
//  syphon.sendImage(canvas);
  
  if(frameCount % 1000 == 0) {
    println("Frame Rate is " + frameRate); 
  }
  
}

// -------

void drawMode() {
 if(mode == 1) mode1_RGBCube();
 if(mode == 2) mode2_Icosahedra();
 if(mode == 3) mode3_LightsGL();
 if(mode == 4) mode4_SpaceJunk();
 if(mode == 5) mode5_GeoPlanet(); 
 if(mode == 6) mode6_Esfera(); 
 if(mode == 7) mode7_Fireworks(); 
 if(mode == 8) mode8_Smoke(); 
}

// --------

void keyPressed() {
  if(key != CODED) {
    background(0);
    if(keyCode == '1') mode = 1;
    if(keyCode == '2') mode = 2;
    if(keyCode == '3') mode = 3;
    if(keyCode == '4') mode = 4;
    if(keyCode == '5') mode = 5;
    if(keyCode == '6') mode = 6;
    if(keyCode == '7') mode = 7;
    if(keyCode == '8') mode = 8;
    if(mode == 8 || mode == 7 && key == ' ') {
      fillRect =! fillRect;
    }
  }
  
}

// ------

public void stop() {
  in.close();
  minim.stop();
  super.stop();
}
