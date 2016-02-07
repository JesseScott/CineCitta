
// IMPORTS
import java.awt.*;

import processing.opengl.*;
//import codeanticode.glgraphics.*;
//import codeanticode.gsvideo.*;

//import fullscreen.*;
//import japplemenubar.*;

import processing.video.*;
import hypermedia.video.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

// DECLARATIONS

//SoftFullScreen sfs;

Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;

// VARIABLES

int Mode = 5;

// Mode 1
public int numPixels;
int blockSize = 20;
color camColors[];
int rp;

// Mode 2
detectface detectthread;
public mycapture cap;
PImage[] invaders = new PImage[4];
int imageArray = 0;
final static int w = 640;
final static int h = 480;
final static int w1 = 320;
final static int h1 = 240;
final static float factor = 2; 
final static float max_blur = 3;
final static int max_blur_img = 20;
PImage[] blurM = new PImage[max_blur_img];

// Mode 3 / 6
float r = 255;
float g = 255;
float b = 255;
boolean fillRect = false;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int sd = 4;

// Mode 4
PImage a;
int [][] aPixels;
int res = 4;

// Mode 5
String bandName = "";
PFont bandText[] = new PFont[4];
int fontArray = 0;

// Mode 7

//----------------


public void init() {
  frame.removeNotify(); 
  frame.setUndecorated(true);   
  frame.addNotify(); 
  super.init();
}

//----------------

void setup() {
  // Screen Stuff
  size(1280, 960, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  //smooth();
  noCursor();

  
//  frame.dispose();  
//  frame.setUndecorated(true);
//  super.init();

  frame.setLocation(0, 0);

  frameRate(60);


  // Mode 1 : Pixelate
  numPixels = width / blockSize;
  camColors = new color[numPixels * numPixels];

  // Mode 2 : Space Invader
  invaders[0] = loadImage("spaceInvader1.png");
  invaders[1] = loadImage("spaceInvader2.png");
  invaders[2] = loadImage("spaceInvader3.png");
  invaders[3] = loadImage("spaceInvader4.png");

  create_blur(invaders[imageArray]);

  cap = new mycapture(this, 640, 480, 7);
  detectthread = new detectface(this, cap, 50, 640, 480, 320, 240);
  detectthread.start();

  // Mode 3 : Audio
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(100);
  bl = new BeatListener(beat, in);
  
  //Mode 4 : Dots
  a = invaders[imageArray];
  aPixels = new int[a.width][a.height];
  for(int i = 0; i < a.height; i += res) {
    for(int j = 0; j < a.width; j += res) {
      aPixels[j][i] = a.pixels[i*a.width+j];
    }
  }
  
  // Mode 5 : Text
  bandText[0] = createFont("1_ABSTRACT.TTF", 32, true);
  bandText[1] = createFont("2_V5PRC.TTF", 32, true);
  bandText[2] = createFont("3_VISITOR.TTF", 32, true);
  bandText[3] = createFont("4_INVADERS.TTF", 32, true);

}



//----------------

void draw() {
  int fps = round(frameRate);
  println("FPS is " + fps);
  println("MODE is " + Mode);
  // Color by Freq  
  if(beat.isKick()) r = random(255);
  if(beat.isSnare()) g = random(255) + 25;
  if(beat.isHat()) b = random(255) +50;

  drawingMode();
  //saveFrame("saves/frame-#####.jpg");
}

//----------------

void keyPressed() {
  if(key != CODED) {
    background(0);
    if (keyCode == '1') {
      Mode = 1;
    }
    else if (keyCode == '2') {
      Mode = 2;
    } 
    else if (keyCode == '3') {
      Mode = 3;
    }
    else if (keyCode == '4') {
      Mode = 4;
    }
    else if (keyCode == '5') {
      Mode = 5;
      //bandName = "";
    }
    else if (keyCode == '6') {
      Mode = 6;
    }
    else if (keyCode == '7') {
      Mode = 7;
    }
    else if (keyCode == '8') {
      Mode = 8;
    }
    else if (keyCode == '9') {
      Mode = 9;
    }
    if(Mode == 3 && key == ' ') {
     fillRect =! fillRect; 
    }
    if(Mode == 6 && key == ' ') {
     fillRect =! fillRect; 
    }
    if(Mode == 8 && key == ' ') {
     fillRect =! fillRect; 
    }
    if(Mode == 5) {
      bandName += key; 
      if(key == BACKSPACE) {
        bandName = "";
      }
    }
  }
  if(key == CODED) {
    if(keyCode == UP) {
      if(Mode == 2 || Mode == 4) {
        if(imageArray == 3) imageArray = 3;
        if(imageArray < 3) imageArray++;
        if(Mode == 2) create_blur(invaders[imageArray]);
        if(Mode == 4) reInitImage();
      }
      else if(Mode == 5) {
        if(fontArray == 3) fontArray = 3;
        if(fontArray < 3) fontArray++;
      }
      else if(Mode == 6) {
        sd++;
      }
    }
    else if(keyCode == DOWN) {
      if(Mode == 2 || Mode == 4) {
        if(imageArray == 0) imageArray = 0;
        if(imageArray > 0) imageArray--; 
        if(Mode == 2) create_blur(invaders[imageArray]);
        if(Mode == 4) reInitImage(); 
      }
      else if(Mode == 5) {
        if(fontArray == 0) fontArray = 0;
        if(fontArray > 0) fontArray--;  
      }
      else if(Mode == 6) {
        sd--;
      }
    } 
    else if(keyCode == LEFT) {
      if(res > 1) res--;
    }
    else if(keyCode == RIGHT) {
      res++;
    }
  }
}

public void stop() {
  detectthread.quit();
  delay(2000);
  cap.stop();
  in.close();
  minim.stop();
  super.stop();
}

