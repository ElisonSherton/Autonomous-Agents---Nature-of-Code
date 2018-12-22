class Vehicle {
  PVector pos, vel, acc;
  int mass,scl;
  // Scl marks the size of the vehicle.
  // Larger the scale, bigger the vehicle

  Vehicle(int x, int y, int m) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = m;
    scl = 30;
  }

  void update() {
    vel = vel.add(acc);
    pos = pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector f) {
    PVector acceleration = PVector.div(f, mass);
    acc.add(acceleration);
  }

  void display() {
    fill(0, 255, 255);
    PVector dir = PVector.div(vel, -(1.0/scl)*vel.mag());
    float angle = -atan(dir.x/dir.y);
    PVector p1 =  new PVector(pos.x + dir.x - scl * cos(angle), pos.y + dir.y - scl * sin(angle));
    PVector p2 = new PVector(pos.x + dir.x + scl * cos(angle), pos.y + dir.y + scl * sin(angle));
    stroke(0);
    fill(255,100);
    beginShape();
    vertex(p1.x,p1.y);
    vertex(p2.x,p2.y);
    vertex(pos.x,pos.y);
    endShape(CLOSE);
  }
}
