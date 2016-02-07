
// Function

void mode3_LightsGL() {
  defineLights();
  canvas.stroke(br,bg,bb,ba);
  for (int x = 0; x <= width; x += 100) {
    for (int y = 0; y <= height; y += 100) {
      canvas.pushMatrix();
        canvas.translate(x, y);
        canvas.rotateX(frameCount*PI/br);
        canvas.rotateY(frameCount*PI/-br);
        canvas.box(90);
      canvas.popMatrix();
    }
  }
}

// Define Lights
void defineLights() {
  // Orange point light on the right
  canvas.pointLight(br, bg/2, 0,   // Color
             200, -150, 0); // Position

  // Blue directional light from the left
  canvas.directionalLight(0, bg/2, bb, // Color
                   1, 0, 0);    // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  canvas.spotLight(br, bg, bb/2,  // Color
            0, 40, 200,     // Position
            0, -0.5, -0.5,  // Direction
            PI / 2, 2);     // Angle, concentration
}

// END
