ArrayList<Plant> forest = new ArrayList<Plant>(); 
float maxPossibleHeight = 2*height/7;
PainManager pm;
float pr = 6, prCopy = 6;
float index2 = 11;
float speedY = 2;
float prBase = 9;
int index = 0;
float mh;   
//maximum height
Sky sky;

//initial minute and second
float initMin, initSec;

class Environment {                                                                                     //glue everything together

  ////////////////////////////////////////////////////////////////////////////////
  ///////////fields///////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  //make an object of pain manager
  //making an object of sky
  Ground g;                                                                                            //making an object of the ground
  //adding flowers to the forest arraylist

  ////////////////////////////////////////////////////////////////////////////////
  ///////////constructor//////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  Environment() {
    g = new Ground();
    sky = new Sky();
    pm = new PainManager();


    updateMh();
    //making objects from Pain Manager
    //PGraphics back = createGraphics(width, height, P2D);                                                //for leaves
    initMin = minute();
    initSec = second();
    forest.add(new Tree(mh, 
      new PVector(random(10, (50+((initMin - minute())*60))), height-100)));
    println("00  "+((Tree)forest.get(forest.size()-1)).pos.x);
  }

  ////////////////////////////////////////////////////////////////////////////////
  ///////////methods//////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  void drawTheGame() {
    sky.drawClounds(pr);
    pm.extractPainLevel();
    // get pr from PainManager
    pr = prCopy;
    // check if pr is changing
    if (pr >= 0) {
      if (pr <= prBase + 2 && pr >= prBase -2) {
        if (forest.get(index).isGrowing) {                                                                //no change->grow       
          forest.get(index).update();                                                                     //grwoing previous ones
        } else if (index == forest.size()-1) {                                                            //if its the last tree
          index++;
          println("making new one");
          float r =random(10, (50+(((minute()-initMin)*60)+ (second() - initSec))));
          forest.add(new Tree(mh, 
            new PVector(r, height-100)));                        // adding new one
          println("01  "+index+"  "+ r+ "  --" +(forest.size()-1)+" -- "+((Tree)forest.get(forest.size()-1)).pos.x);
        }
      } else if (pr > prBase+2) {
        updateMh();                                                                                       //update mh  
        prBase = pr;                                                                                      //big leap
        forest.get(index).isGrowing = false;                                                              //is growing for this one = false
      } else if (pr<prBase-2) {
        println("relax!");
      }
    } else if (pr<0) {                                                                                    // do nothing right now
    }

    setIndex();
    g.drawG(pr);
  }

  void setIndex() {
    index = 0;
    updateMh(); 
    for (int i = 0; i<forest.size(); i++)
    {
      index = i;
      println("before condition " +" "+mh+"  ------ "+ forest.get(i).pHeight+ "  "  + forest.get(i).isGrowing + "!!!!!!! " + i);
      if ( (forest.get(i).isGrowing && !((Tree)forest.get(i)).noResponseTree) || (forest.get(i).pHeight < mh && !forest.get(i).isGrowing ))         //if it is smaller than new maxHeight and it had stopped growing
      {
        forest.get(i).maxHeight = mh;                                                                    //1-set heights to the new global height if it has changed
        forest.get(i).isGrowing = true;
        println("+++++++++++++++++++++++++++++++++++++++++++++");
        return;
      }
    }
    println("-----------------------------------------");
  }



  void updateMh() {
    mh = index2*log(pr)+1400;
    speedY = log(pr);
  }
}
