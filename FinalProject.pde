/*
In this project I want to let trees and the shape of the sky show user's pain improvement:
 How?
 for the this course(with GSR only) we get patients' GSR level through network
 we process this GSR level intitially in PainManager class[later] and extract a pain level based on that.
 This pain level out put named: pr(pain relief)coef. is the GSR diagram slope* -. 
 no 3 things might happen....
 
 -negative pr             --> nothing happens( tree threads remained unchanged!)
 -positive pr +  constant --> trees grow up to that level when one reaches the maximum(based on pr), a new one adds--> a jungle!
 -positive pr +  growing  --> when we see a leap in pr, then old trees can grow more(up to the new level)
 
 so, a dense tree means that a pain relief was constantly hapening,
 while a higher one means that this improvement was hapening faster(based on the sensor)
 each tree has it's own thread.
 */

import controlP5.*;                                                                                    //import the whole library

Environment e;
Button play, end;
ControlP5 controlP5;                                                                    


int state;
PFont pfont,pfont2;
final int INIT = 0;
final int START = 1;
final int FINISH = 2;


void setup() 
{
  state = INIT;
  frameRate(60);
  size(2000, 1500);                                                                                     // Set screen size & renderer
  background(5, 10, 60);
  
  e = new Environment();

  controlP5 = new ControlP5(this);
  pfont = loadFont("TrajanPro-Bold-60.vlw");
  pfont2 = loadFont("TrajanPro-Bold-20.vlw");
  
  end = controlP5.addButton("End", 0, width - 100, 0, 100, 50);
  play = controlP5.addButton("Start", 0, 4*width/11+60, height/2, 400, 150);
  
  end.setColorLabel(color(5, 8, 60));
  play.setColorLabel(color(5, 8, 60));  
  end.getCaptionLabel().setFont(pfont2);
  play.getCaptionLabel().setFont(pfont);
  end.setColorForeground(color(70, 70, 70)); 
  end.setColorBackground(color(70, 70, 70));
  play.setColorForeground(color(70, 70, 70)); 
  play.setColorBackground(color(70, 70, 70));
  
  end.hide();
}


void draw() 
{
  switch(state) 
  {
    case INIT:
      drawInit();
      break;
    case START:
      e.drawTheGame();
      end.show();
      break;
    case FINISH:
      store();
      exit();
      break;
      
  }
}


void mousePressed()
{                                                                                   //simulate leap in pr!
  prCopy += random(100);
}

void drawInit()
{
  play.show();
  textSize(80);
  fill(color(90, 90, 100));
  textFont(pfont);
  text("You feel less pain, when you plant a tree...", width/10+20, height/2-100);
  text("what if you plant a forest?", 3*width/13+20, 3*height/4-100);
  
}

void controlEvent(ControlEvent theEvent)
{
  if (theEvent.getController().getName() =="Start")
  { 
    background(5, 8, 60);
    state = START;
    play.hide();
    end.show();
  }
  if (theEvent.getController().getName() =="End")
  { 
    state = FINISH;
    play.hide();
    end.hide();
  }
  
}

void store(){
  saveFrame();
}
