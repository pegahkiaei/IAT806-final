class Memory extends MovingObject {
int cor; //can i do this?
  Memory(PVector pos, PVector vel, int cor) {
    super(pos, vel);
    this.cor=cor;
  }

  void Move() {
  }

  void update() {
  }

  void drawMe() {
    noStroke();
    fill(cor);
    pushMatrix();
    translate(pos.x, pos.y);
    triangle(0,0,30,0,15,30); 
    popMatrix();
  }
}
