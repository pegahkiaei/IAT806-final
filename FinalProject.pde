/*
In this project I want to let trees and the shape of the sky show user's pain improvement:
 How?
 for the this course(with GSR only) we get patients' GSR level through network[later]
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

import controlP5.*;    //import the whole library

Button play;
Environment e;
ControlP5 controlP5;    //declare variable of ControlP5



int state;
final int INIT = 0;
final int START = 1;


void setup() 
{
  state = INIT;
  frameRate(3);
  size(2000, 1500);                                                                                     // Set screen size & renderer
  background(5, 8, 80);
  
  e = new Environment();

  controlP5 = new ControlP5(this);
  PFont pfont = loadFont("TrajanPro-Bold-60.vlw");
  play = controlP5.addButton("Start", 0, 4*width/11, height/2+100, 400, 150);
  
  play.setColorLabel(color(10,50,10));
  play.getCaptionLabel().setFont(pfont);
  play.setColorForeground(color(70, 70, 70)); 
  play.setColorBackground(color(70, 70, 70));
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
      break;
  }
}
void mousePressed() {                                                                                   //simulate leap in pr!
  prCopy += random(100);
  println("                                           random:    "+ prCopy+"base:  "+prBase  );
}

void drawInit()
{
  play.show();
  textSize(80);
  fill(color(90, 90, 90, 200));
  text("Please click on start to begine.", width/5, height/2);
}

void controlEvent(ControlEvent theEvent)
{
  if (theEvent.getController().getName() =="Start")
  { 
    background(5, 8, 80);
    state = START;
    play.hide();
  }
}
