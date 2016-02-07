
// Define Lights
void defineLights() {
  // Orange point light on the right
  canvas.pointLight(br +ba, bg +ba, bb +ba,   // Color
             br + ba, br -ba, bb/ba); // Position

  // Blue directional light from the left
  canvas.directionalLight(bb +ba, bg +ba, br +ba, // Color
                   1, bg/ba, 0);    // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  canvas.spotLight(br, bg, bb,  // Color
            0, ba/2, ba,     // Position
            br/bb, -0.5, -0.5,  // Direction
            PI / 2, 2);     // Angle, concentration
}
