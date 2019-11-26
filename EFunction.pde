class EFunction{
  int repChar;
  int order;
  PVector pos;
  
  EFunction(PVector pos, int repChar, int order){
   this.pos=pos; 
   this.repChar=repChar;
   this.order=order;
  }
    
    boolean detectClick(PVector cPos){
     return  pos.dist(cPos)<10;
    }
    

 
  void drawMe(){
    noFill();
    stroke(10);
    pushMatrix();
    translate(pos.x,pos.y);
    text(char(repChar),-5,+5);
    ellipse(0,0, 60,60);
    popMatrix();
  }
}
