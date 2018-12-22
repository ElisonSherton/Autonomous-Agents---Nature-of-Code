Vehicle v;
Nucleas n;
float maxSpeed;
PVector steer;

void setup() {
  maxSpeed = 10;
  size(600, 600);
  background(0);
  v = new Vehicle(width/2, height/2, 1);
}

void draw() {
  background(0);
  
  // Keep updating the nucleas to the new positoin of the mouse
  n = new Nucleas(mouseX, mouseY);
  n.show();
  
  // Calculate the desired Velocity
  PVector desiredV = PVector.sub(n.pos, v.pos);
  
  // Normalized version of desired Velocity
  PVector desired = PVector.mult(desiredV, 1/desiredV.mag());
  
  // Decide the magnitude of desired velocity to be set
  // Based on he distance of the vehicle from the nucleas
  if (desiredV.mag() >= n.cohesion_radius) {
    desired.mult(maxSpeed);
    steer = PVector.sub(desired, v.vel);
  } else {
    float vMag = map(desiredV.mag(), n.cohesion_radius, 0, maxSpeed, 0);
    desired.mult(vMag);
    steer = PVector.sub(desired, v.vel);
  }
  
  // Apply the steering force and update the position
  // Of the vehicle.
  v.applyForce(steer);
  v.update();
  v.display();
}
