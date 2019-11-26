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
Environment e;
void setup() {
  size(2000, 1500);                                                                                     // Set screen size & renderer
  background(5, 8, 80);
  frameRate(3);
  e =  new Environment();
}
void draw() {
  e.drawTheGame();
}
void mousePressed() {                                                                                   //simulate leap in pr!
  prCopy += random(100);
  println("                                           random:    "+ prCopy+"base:  "+prBase  );
}
