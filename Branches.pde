class Branches {

  int age;                                                                //each branch has it's age defined in iteration. older ones get thiner and brighter
  //if the age reaches maxLife, it stops growing(not alive)==> 
  //then we add 4 new branches)by chance)
  float stw;                                                              //stroke width
  float gen;                                                              //shows the generation of the branch. starts from 0 and increase by 0.1 each step
  float angle;                                                            //branch angle with regards to other branches
  float baseC;
  PVector pos;                                                            //starting position
  PVector speed;                                                          //tree growth speed how much the branch grows in each iteration
  boolean alive;
  float deviation;                                                        //angle between parent and child branch
  float colorCoeff;
  PVector parentPos;
  float maxLife = 40;
  float[] kidsProbability = new float[4];


  Branches(PVector startPos, float stw, float angle, float gen, float[] kp, float base, float cocoef, PVector pp) {
    age = 0;                                                              //initially 
    alive = true;
    baseC = base;
    this.gen = gen;
    this.stw = stw;
    this.angle = angle;
    this.pos = startPos;
    colorCoeff = cocoef;
    this.parentPos = pp;
    this.deviation=random(.2, .7);
    speed = new PVector(0, -2);
    this.maxLife=maxLife*random(.3, .8);

    //leaveImage = createLeaveImage();

    kidsProbability[0] = kp[0];
    kidsProbability[1] = kp[1];
    kidsProbability[2] = kp[3];
    kidsProbability[3] = kp[2];
  }

  void grow(ArrayList<Branches> brs, float mstw) {

    if (age == int(maxLife/gen)||random(1)<.01*gen) {                     //branch has reached its max age (or random decides it dies sooner)
                                                                          //maxLife/gen ==> the first branches last longer(are longer)       
      alive=false;                                                        //time to die!
                                                                          //image(leaveImage, -leaveImage.width/2, 0);
      if (stw>mstw) {                                                     //devide if it was thick enough(this will change based on pr)[0,20]
        //divisions depend on the tree 'probalities'.
        if (random(1)<kidsProbability[0]/gen)brs.add(new Branches(new PVector(pos.x, pos.y), stw*random(.2, 1), angle+random(.7, 1.1)*deviation, gen+.1, kidsProbability, baseC, colorCoeff, parentPos));//;//
        if (random(1)<kidsProbability[1]/gen)brs.add(new Branches(new PVector(pos.x, pos.y), stw*random(.2, 1), angle-random(.7, 1.1)*deviation, gen+.1, kidsProbability, baseC, colorCoeff, parentPos));
        if (random(1)<kidsProbability[2]/gen)brs.add(new Branches(new PVector(pos.x, pos.y), stw*random(.5, .8), angle+random(.2, 1)*deviation, gen+.1, kidsProbability, baseC, colorCoeff, parentPos));
        if (random(1)<kidsProbability[3]/gen)brs.add(new Branches(new PVector(pos.x, pos.y), stw*random(.5, .8), angle-random(.2, 1)*deviation, gen+.1, kidsProbability, baseC, colorCoeff, parentPos));
      }
    } else {
      speed.x+=random(-.8, .8);                                          //branch is still alive, it grows. it might lean to -x direction sometimes ==> natural
    }
  }

  void displayBranch() {
    float x0 = pos.x;
    float y0 = pos.y;
    speed.y = -1 * speedY;
    pos.x += speed.x*cos(angle)+speed.y*sin(angle);                      //rotation of the branch segment around its origin
    pos.y += speed.x*sin(angle)+speed.y*cos(angle);

    //shadows
    stroke(baseC + age+10*gen, 0, 0, .04);
    float dis=.005*pow(parentPos.y-y0, 1.8);
    strokeWeight(map(age, 0, maxLife, stw*1.3, stw*.9));
    line(x0+dis*random(.5, 1.2), 2*parentPos.y-y0+dis*random(.5, 1.2),
      pos.x+dis*random(.5, 1.2), 2*parentPos.y-pos.y+dis*random(.5, 1.2));//*sin(.3*(st.y-y0))//sin(.3*(st.y-this.position.y))*
    line(x0+dis*random(.5, 1.2), 2*parentPos.y-y0+dis*random(.5, 1.2),
      pos.x+dis*random(.5, 1.2), 2*parentPos.y-pos.y+dis*random(.5, 1.2));



    stroke(baseC + age+50*gen, 50+ 50*colorCoeff, 50+20*gen, 160*colorCoeff+60);
    strokeWeight(map(age, 0, maxLife, stw, stw*.6));
    line(x0, y0, pos.x, pos.y);
  }

  //  PImage createLeaveImage() {
  //    PGraphics buffer = createGraphics(12, 18, P2D);
  //    buffer.beginDraw();
  //    buffer.background(#000000, 0);
  //    buffer.stroke(0,100,0);
  //    buffer.line(6, 0, 6, 6);
  //    buffer.noStroke();
  //    buffer.fill(#749600);
  //    buffer.beginShape();
  //    buffer.vertex(6, 6);
  //    buffer.bezierVertex(0, 12, 0, 12, 6, 18);
  //    buffer.bezierVertex(12, 12, 12, 12, 6, 6);
  //    buffer.endShape();
  //    buffer.fill(#8bb800);
  //    buffer.beginShape();
  //    buffer.vertex(6, 9);
  //    buffer.bezierVertex(0, 13, 0, 13, 6, 18);
  //    buffer.bezierVertex(12, 13, 12, 13, 6, 9);
  //    buffer.endShape();
  //    buffer.stroke(#659000);
  //    buffer.noFill();
  //    buffer.bezier(6, 9, 5, 11, 5, 12, 6, 15);
  //    buffer.endDraw();
  //    return buffer.get();
  //}
}
