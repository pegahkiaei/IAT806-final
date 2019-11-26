class MovingObject{
  PVector pos;
  PVector vel;
  
  MovingObject(PVector pos,PVector vel){
    this.pos=pos;
    this.vel=vel;
  }
  
  void update(){
   move(); 
  }
  
  void move(){
   pos.add(vel);
   
  }
}
