//responsible for gradually grinish the ground based on the pain level 
class Ground {
  GroundPieces[] ground = new GroundPieces[40];
  
  Ground()
  {
    for (int i=0; i<40; i++) 
    {
      ground[i]  = new GroundPieces(width/40*i, random(height-150, height-60), width/40*(i+1), 
                                    random(height-150, height-60),width/40*(i),random(height-100, height-60));
    }
  }

  void drawG(float pr)
  {            
    push();
    noStroke();
    beginShape();
    fill(63, 122, 77, pr);
    for (int i=0; i<40; i++) 
    {
      vertex(ground[i].x1, ground[i].y1);
      bezierVertex(ground[i].x, ground[i].y,ground[i].x2, ground[i].y2,ground[i].x3, ground[i].y3);
    }
    vertex(ground[39].x2, height);
    vertex(ground[0].x1, height);
    endShape(CLOSE);
    pop();
  }
}
class GroundPieces 
{

  float x1, y1, x2,y2, x3, y3;  
  float x, y, lenght, rot;

  GroundPieces(float x1, float y1, float x2, float y2, float x3, float y3) 
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    x = (x1+x2)/2;
    y = (y1+y2)/2;
  }
}
