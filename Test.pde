//class Test extends Thread {
//  int index;
  
//  PGraphics pg; 
//  int p;
//  Test() {
//    pg = createGraphics(500, 500);
//    p =0;
//  }
//  public void run() 
//  {        pg = createGraphics(500, 500);


//    try
//    { 

//      while(p != 100) {
//        p++;
//        drawMe(p);

//        //if()
//        //  p=0;

//      }
//    } 
//    catch (Exception e) 
//    { 
//      // Throwing an exception 
//      System.out.println (e+"Exception is caught");
//    }
//  } 

//  void drawMe(int p) {

//    pg.beginDraw();
//    pg.background(255);
//    pg.fill(random(100, 255), random(100, 255), 0);
//    pg.ellipse(0, 0, p, p);
//    pg.updatePixels();
//    pg.endDraw();
//  }
//}

//void draw() {
//  // get pr from PainManager
//  if (o%100 ==1) {
//    forest.add(m,new Test());
//    forest.get(m).start();
//    image(forest.get(m).pg, random(1, width), random(1, height));
//    m++;
//  }
//  println(o++);
//}
