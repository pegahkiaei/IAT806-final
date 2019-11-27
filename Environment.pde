ArrayList<Plant> forest = new ArrayList<Plant>(); 
float maxPossibleHeight = 2*height/7;
float pr = 6, prCopy = 6;
float index2 = 11;
float speedY = 2;
float prBase = 9;
int index = 0;
float mh;   
//maximum height
PainManager pm;
Ground g;                                                                                            //making an object of the ground
Sky sky;

//initial minute and second
float initMin, initSec;

class Environment {                                                                                  //glue everything together

  ////////////////////////////////////////////////////////////////////////////////
  ///////////fields///////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////


  ////////////////////////////////////////////////////////////////////////////////
  ///////////constructor//////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  Environment() { 
    
    sky = new Sky();
    g = new Ground();
    pm = new PainManager();                                                                              


    updateMh();
    initMin = minute();
    initSec = second();
    forest.add(new Tree(mh, 
      new PVector(random(10, (50+((initMin - minute())*60))), height-100)));
  }

  ////////////////////////////////////////////////////////////////////////////////
  ///////////methods//////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  void drawTheGame() 
  {
    sky.drawClounds(pr);
    pr = pm.extractPainLevel();                                                                           // get pr from PainManager
    pr = prCopy;                                                                                          //TODO:for without gsr
    
    if (pr >= 0) 
    {                                                                                                    // check if pr is changing
      if (pr <= prBase + 2 && pr >= prBase -2) 
      {
        if (forest.get(index).isGrowing) 
        {                                                                                                 //no change->grow       
          forest.get(index).update();                                                                     //grwoing previous ones
        } 
        else if (index == forest.size()-1) 
        {                                                                                                 //if its the last tree
          index++;
          float r =random(10, 
              (50+(((minute()-initMin)*60) + (second() - initSec))));
          forest.add(new Tree(mh, new PVector(r, height-100)));                                           // adding new one
        }
      } 
      else if (pr > prBase+2) 
      {
        updateMh();                                                                                       //update mh  
        prBase = pr;                                                                                      //big leap
        forest.get(index).isGrowing = false;                                                              //is growing for this one = false
      } 
      else if (pr < prBase-2) 
      {
        println("relax!");
      }
    } 
    else if (pr < 0){}                                                                                   // do nothing right now
    
    setIndex();
    g.drawG(pr);
  }

  void setIndex() 
  {
    index = 0;
    updateMh(); 
    
    for (int i = 0 ; i< forest.size() ; i++)
    {
      index = i;
      if ( (forest.get(i).isGrowing && !((Tree)forest.get(i)).noResponseTree) || 
        (forest.get(i).pHeight < mh && !forest.get(i).isGrowing ))                                     //if it is smaller than new maxHeight and it had stopped growing
      {
        forest.get(i).maxHeight = mh;                                                                    //1-set heights to the new global height if it has changed
        forest.get(i).isGrowing = true;
        return;
      }
    }
  }



  void updateMh() 
  {
    mh = index2*log(pr)+1400;
    speedY = log(pr);
  }
}
