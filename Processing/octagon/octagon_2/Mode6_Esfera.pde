 
// Function

void mode6_Esfera() {
  //pushMatrix();
    translate(width/2, height/2);
    rotateY(br);
    rotateX(-br);
    scale(1.0 + in.mix.get(ba) * 20);
    fill(0);
    noStroke();
    sphere(radio);
  //popMatrix();
  for (int i=0;i<cuantos;i++){
    lista[i].dibujar();
  }
  
}

// PELO
class pelo {
  float z = random(-radio,radio);
  float phi = random(TWO_PI);
  float largo = random(1.15,1.2);
  float theta = asin(z/radio);

    void dibujar(){

    float off = (noise(millis() * 0.0005,sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007,sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);
    float msx= screenX(x,y,z);
    float msy= screenY(x,y,z);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;
    
    beginShape(LINES);
      stroke(br/2, bg/2, bb/2);
      vertex(x,y,z);
      stroke(br, bg, bb, in.mix.get(ba));
      strokeWeight(2);
      vertex(xb,yb,zb);
    endShape();
  }
}
 // END
