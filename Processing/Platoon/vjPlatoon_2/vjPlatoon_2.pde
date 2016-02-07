
// IMPORTS
import codeanticode.syphon.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

// DECLARATIONS
PGraphics canvas;
SyphonServer syphon;

Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;

BeatBox br, bg, bb;

// VARIABLES

int Mode = 1;

// Mode 1
PFont myFont;
String[] fontList = PFont.list();
boolean fillShape = true;
boolean detected = false; // to avoid NPE
float avg;
float y;
String tempS;
String letterOrder =
  " .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLu" +
  "nT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q";
char[] letters;
char tempR, tempG, tempB;

// Mode 2
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
float gg = 255;
float b = 255;
int aa = 0;
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

void setup() {
  // Screen Stuff
  size(640, 360, P3D);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  canvas = createGraphics(width, height, P3D);  
  syphon = new SyphonServer(this);

  // Mode 1 : Word
  letters = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letterOrder.length()));
    letterOrder.toUpperCase();
    letters[i] = letterOrder.charAt(index);
  }
  
  br = new BeatBox(color(r, gg, b), 5*(width/6), 3*(height/4), tempR);
  bg = new BeatBox(color(r, gg, b), 5*(width/6), 3*(height/4), tempG);
  bb = new BeatBox(color(r, gg, b), 5*(width/6), 3*(height/4), tempB);
  
  // Mode 2 : Space Invader
  invaders[0] = loadImage("spaceInvader1.png");
  invaders[1] = loadImage("spaceInvader2.png");
  invaders[2] = loadImage("spaceInvader3.png");
  invaders[3] = loadImage("spaceInvader4.png");

  create_blur(invaders[imageArray]);


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

// ---------------

void enableVSync() {
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  javax.media.opengl.GL gl = pgl.beginGL();
  gl.setSwapInterval(1);
  pgl.endGL();
}

//----------------

void draw() {
  // FPS
  frameRate(60);
  int fps = round(frameRate);
  if(frameCount % 1000 == 0) {
    println("Frame Rate is " + frameRate); 
  }
  
  // VSync
  enableVSync();
  
  // Minim  
  analyzeSound();

  // Syphon
  canvas.beginDraw();
    canvas.background(0);
    drawingMode();
  canvas.endDraw();
  image(canvas, 0, 0);
  syphon.sendImage(canvas);
  

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

// --------------

public void stop() {
  in.close();
  minim.stop();
  super.stop();
}

