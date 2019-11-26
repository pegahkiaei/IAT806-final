class PainManager {
  //get data from GSR Reader and process it  and extract patient's pain[phase3] 
  float input;
  float gsrBaseline;
  float painRel;
  int numOfDataForSettling = 0;
  int max =10000;
  float peak;
  float initMin,initSec, initMil;
  GsrReader gsr;


  PainManager() {
    gsr = new GsrReader();
    gsr.start();
    gsrBaseline = gsr.readData();
  }


  float extractPainLevel() {
    input = gsr.readData();
    //get the pain relief
    updateBaseline();
    if(input > peak + (peak - gsrBaseline)){
      //update peak, no relief
      peak = input; 
      initMin = minute();
      initSec = second();
      initMil = millis();
      painRel = -1;
    }
    else{
      //getting the line slop
      float slop = (peak - input)/((minute() - initMin)*3600 + (second() - initSec)*60 + (millis() - initMil));//deltaX/deltaT
      //checking if the slope was negative and high, then changes are significatn = > rturnung higher pr      
      
    }
    
    //println("--------------------------------------------------data:--------------------"+ input);
    return painRel;
  }
  void updateBaseline(){
    if(numOfDataForSettling <max){
      gsrBaseline = ((gsrBaseline*numOfDataForSettling) + input)/((float)(++numOfDataForSettling));
    }
  }
}
