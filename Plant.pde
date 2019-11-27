class Plant {

  float pHeight;
  float maxHeight;
  boolean isGrown;
  boolean isGrowing;


  ////////////////////////////////////////////////////////////////////////////////
  ///////////constructor//////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  
  Plant(float maxHeight)
  {
    this.maxHeight = maxHeight;
  }



  //===========================================
  //public void run() 
  //  { 
  //      try
  //      { 
  //          // Displaying the thread that is running 
  //          System.out.println ("Thread " + 
  //                Thread.currentThread().getId() + 
  //                " is running"); 


  //      } 
  //      catch (Exception e) 
  //      { 
  //          // Throwing an exception 
  //          System.out.println ("Exception is caught"); 
  //      } 
  //  } 

  void grow() 
  {}


  void update() 
  {
    if (maxHeight >= maxPossibleHeight && !isGrowing)
    {
      isGrown = true;                                                                                      //all grown up.nomore!

    } 
    grow();
  }
}
