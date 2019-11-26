class SecondState {
  ArrayList<EFunction> efunction=new ArrayList<EFunction>();
  Car car; 
  int blackNumber; //number of dark triangles
  int n=8; //number of circles
  int lastClickedOrder = -1;
  float[] time = new float[4];
  EFunction ef;

  SecondState() {
    car=new Car(new PVector(mouseX, mouseY), new PVector(0, 0));
    //PEGAH : moved that adding new efunctions to a method
    addEfunction();
  }

  void update() { 
    clickHandle();
    drawMe();
  }

  void drawMe() {
    background(94, 161, 89);
    car.update();//PEGAH:CHANGED THIS ONE TO UPDATE:)) mainly because I like using extra useless functions!
    for (int i=0; i<efunction.size(); i++) {
      efunction.get(i).drawMe();
    }
  }

  void clickHandle() {
    int counter=3;
    //detect clicking
    if (clickDetection())
    { 

      //Recod time for the first and the last one
      if (ef.order == 0 ) {
        reactionTimeRecord(0);
      }
      //check if order is correct - 
      if (ef.order == lastClickedOrder+1) {
        lastClickedOrder = ef.order;//update the last clicked one
        //deleting that circle 
        efunction.remove(ef); //remove the circle that was clicked on 
        //checking if it's the final clicK
        if (ef.order == n-1) {
          //record reaction time 
          reactionTimeRecord(2);
          //changing state
          state =1;
        }
      } else {
        counter--;
        if (counter ==0) {
          n=4;
        }
        efunction.clear();
        //if the order is not correct - all circles get deleted, record that was a failed attempt - try again 3 times
        //add new set of circles

        //PEGAH : we couldn't use draw me here for adding new functions because the arraylist's size was zero
        addEfunction();
        println("why!?");
        for (int j = 0; j<n; j++) {  
          efunction.get(j).drawMe();
        }

        //if the order is not correct and the number of attempts is greater than 3, the number of circles reduces from 8 to 4
      }
    }
  }

  void countMemory() {
  }

  boolean clickDetection() {
    if (mousePressed) {
      for (int i=0; i<efunction.size(); i++) {
        if (abs(car.pos.x-efunction.get(i).pos.x)<10 && abs(efunction.get(i).pos.y-car.pos.y)<10) {
          ef = efunction.get(i);//saveing the clicked object
          return true;
        }
      }
    } 
    return false;
  }


  void reactionTimeRecord(int i) {
    time[i]=second();
    time[i+1]=millis();//smallest one)
  }

  void addEfunction() {
    int oddChar = 49;
    int evenChar = 65;
    for (int i=0; i<n; i++) {
      if (i%2==0) {
        efunction.add(new EFunction(new PVector(random(60, width-60), random(60, height-60)), evenChar++, i));
      }
      if (i%2!=0) {
        efunction.add(new EFunction(new PVector(random(60, width-60), random(60, height-60)), oddChar++, i));
      }
      print(char(efunction.get(i).repChar));
    }
  }
}
