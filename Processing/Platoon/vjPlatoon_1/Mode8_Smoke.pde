
// Function

void mode8_Smoke() {
  scale(2.0);
  background(0);
  strokeWeight(1);
  sphereDetail(4);
  stroke(br, bg, bb);  
  if(fillRect == true) {
    fill(br, bg, bb, ba);
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


//END
