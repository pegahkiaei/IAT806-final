class Car extends MovingObject{
  
  Car(PVector pos, PVector vel){
   super(pos,vel); 
  }
  
  void update(){
    pos.x = mouseX;
    pos.y = mouseY;//PEGAH: WE WERE NOT CHANGING THE POS VARIABLE BUT JUST DRAWING THE CAR IN THE MOUSE POSITION
    drawMe();
  }
  void drawMe(){
   noStroke();
   pushMatrix();//PEGAH: I CHANGED THESE LINES AS WELL
   fill(255, 196,0);
   translate(pos.x,pos.y);
   rect(0 - 32, 0 ,20,20); 
   rect(0 + 18, 0,20,20); 
   rect(0-20, 0-20, 45, 40);
   fill(0);
   ellipse(0-16, 0+20, 20,20);
   ellipse(0+20, 0+20, 20,20);
   popMatrix();
  }
}
