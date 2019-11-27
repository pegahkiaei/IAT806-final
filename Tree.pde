/* The code of this class is not purely mine, it is inspired from  
 https://www.openprocessing.org/sketch/635857by Pierre MARZIN 14/11/2018, with modifications and transferring to Java,
 so, there was a need of totall undrestanding of the code*/
class Tree extends Plant {

  float lastStw = 0;
  PVector pos;
  float baseC;
  float colorCoeff;
  int maxLife = 20;
  float maxStrokeWidth = 0;
  boolean noResponseTree = false;
  float[] branchesProbability = new float[4];
  ArrayList<Branches> branches = new ArrayList<Branches>();

  Tree(float mh, PVector pos) 
  {
    super(mh);
    this.pos = pos;                                                                                    //the position of our tre
    maxHeight = mh;                                                                                    //mh(based on the pr)
    this.pHeight =0;                                                                                   //current height
    baseC = random(3, 4);
    this.isGrown = false;                                                                              //if the tree has reached the maxHeight
    this.isGrowing = true;                                                                             //if we are currently rendering this tree
    colorCoeff = random(pos.y/(height-130));                                                           //later use in stroke color
    maxStrokeWidth = map(mh, height, 0, 0.5, 50);



    branchesProbability[0] = random(.8, 1);
    branchesProbability[1] = random(.8, 1);
    branchesProbability[2] = random(.4, .5);
    branchesProbability[3] = random(.4, .5);

    branches.add( new Branches(pos,                                                                   //main branch
    /* 30*sqrt(start.y/height)*/  60, 0, 1, 
      branchesProbability, baseC, colorCoeff, pos));
  }


  void grow() 
  {                                                                                      // drwing the tree.    
  
    int aliveNum = 0;
    for (int i=0 ; i < branches.size() ; i++)
    {
      Branches b = branches.get(i);    
      if (b.alive)
      {                                                                                   //one alive baranch ==> continue
        aliveNum++;
        b.age++;                                                                                       //the older the higher;
        b.grow(branches, maxStrokeWidth);                                                              //grwoing the branch
        b.displayBranch();                                                                             //display the branch
      }
      
      if (aliveNum == 0)
      {
        noResponseTree = true;
      } 
      else 
      {
        noResponseTree = false;
      }
    }
  }

  void update()
  {

    maxStrokeWidth = map(mh, 0, height, 100, 0.5);
    pHeight =  map(branches.get(branches.size()-1).stw, 50, 0.5, 0, height);
    //println(branches.get(branches.size()-1).stw +"    00    "+ map(mh, height, 0, 0.5, 50)+"    **  " +"-------------ph  "+pHeight +"  "+maxStrokeWidth);

    if (pHeight > maxHeight) 
    {                                                                                                  // stop growing
      isGrowing = false;
    }
    super.update();
  }
}
