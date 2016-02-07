
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
FFT fft;

// VARIABLES

//global
float br, bg, bb, ba;
int kickSize, snareSize, hatSize;
int count = 0;
int mode = 9;

boolean basic = false;
boolean toScale = false;
boolean toHSB = false;
boolean toFill = false;
boolean toStroke = true;
float _r, _g, _b, _a;

//1
int numCubes = 10;
float xmagR, ymagR = 0;
float xmagG, ymagG = 0;
float xmagB, ymagB = 0;
float newXmagR, newYmagR = 0; 
float newXmagG, newYmagG = 0; 
float newXmagB, newYmagB = 0;  

//2
int numIso = 4; 
Icosahedron ico1;
Icosahedron ico2;
Icosahedron ico3;

//3

//4
float ang; 
int limit = 750; 
Cube[]cubes = new Cube[limit]; 

//5
int numTri = 256;

//6
int numCircle = 256;

//7
int numRect = 256;

//8
int numLines = 256;

//9

// -------

void setup() {
  //screen
  size(1024, 768, P3D);
  smooth();
  canvas = createGraphics(width, height, P3D);  
  //syphon = new SyphonServer(this);
  noCursor();
  colorMode(RGB);
  
  //minim
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 1024);
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(250);
  bl = new BeatListener(beat, in);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.linAverages(256);  
  
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
  
  //5 Triangles

  
  //6 Circles

  
  //7 Rectangles

  
  //8 

  
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
  //syphon.sendImage(canvas);
  
  if(frameCount % 1000 == 0) {
    int fps = round(frameRate);
    println("Frame Rate is " + fps + " FPS");
    println (hour()+":"+minute()+":"+second()+" Free Memory: "+Runtime.getRuntime().freeMemory()/1024+" K; Garbage collected;");
    System.gc();
    println (hour()+":"+minute()+":"+second()+" Free Memory: "+Runtime.getRuntime().freeMemory()/1024+" K;\n");
  }
  
}

// -------

void drawMode() {
  if(toHSB == false) colorMode(RGB); 
  if(toHSB == true ) colorMode(HSB); 
  if(toScale == true) scale(1.0 + in.mix.get((int)ba)); 
  
  if(mode == 1) mode1_RGBCube();
  if(mode == 2) mode2_Icosahedra();
  if(mode == 3) mode3_LightsGL();
  if(mode == 4) mode4_SpaceJunk();
  if(mode == 5) mode5_Triangles(); 
  if(mode == 6) mode6_Circles(); 
  if(mode == 7) mode7_Rectangles(); 
  if(mode == 8) mode8_Lines(); 
  if(mode == 9) mode9_Eq(); 
  println(mode + "\t" + basic);
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
    if(keyCode == '9') mode = 9;

    if(keyCode == ' ') basic =! basic; 
    if(key == 's') toScale =! toScale;
    if(key == 'r') toHSB = false; 
    if(key == 'h') toHSB = true; 
    
  }
  
  
}

// ------

public void stop() {
  in.close();
  minim.stop();
  super.stop();
}
