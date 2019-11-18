class PainManager {
  //get data from GSR Reader and process it  and extract patient's pain[phase3] 
  float input;
  float painRel;
  GsrReader gsr;


  PainManager() {
    gsr = new GsrReader();
    gsr.start();
  }


  float extractPainLevel() {
    input = gsr.readData();
     //get the pain relief
    println("--------------------------------------------------data:--------------------"+ input);
    return painRel;
  }
}
