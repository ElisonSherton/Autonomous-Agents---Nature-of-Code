class Nucleas {
  PVector pos;
  int cohesion_radius;
  // Cohesion radius marks the circle
  // where the vehicle decelerates to come
  // to a stop at the center of the nucleas
  
  Nucleas(int x, int y) {
    pos = new PVector(x, y);
    cohesion_radius = 500;
  }
  
  void show(){
    fill(255,100);
    ellipse(pos.x,pos.y,30,30);
  }
}
