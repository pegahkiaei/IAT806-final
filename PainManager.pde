//get data from GSR Reader and process it  and extract patient's pain[phase3] 

class PainManager
{
  float peak;
  float input;
  float painRel;
  int max =10000;
  float gsrBaseline;
  int numOfDataForSettling = 0;
  float initMin, initSec, initMil;
  
  GsrReader gsr;


  PainManager()
  {
    gsr = new GsrReader();
    gsr.start();
    gsrBaseline = gsr.readData();
  }


  float extractPainLevel()                                                                            //get the pain relief
  {
    input = gsr.readData();
    updateBaseline();
    if (input > peak + (peak - gsrBaseline))                                                          //update peak, no relief
    {
      peak = input; 
      initMin = minute();
      initSec = second();
      initMil = millis();
      painRel = -1;
    } 
    else 
    {
      float slop = (input - peak)  /((minute() - initMin)*3600 +
        (second() - initSec)*60 + (millis() - initMil));                                              //getting the line slop(deltaX/deltaT)
      float baselineSlop = (gsrBaseline - peak) / ((minute() - initMin)*3600 + 
        (second() - initSec)*60 + (millis() - initMil));                                              //deltaX/deltaT
        
      if (slop < baselineSlop) 
      {                                                                                               //checking if the slope was negative and high, then changes are significatn = > rturnung higher pr
        painRel = abs(slop) / abs(baselineSlop);                                                        //relativeness of slops
      }
    }
    return painRel;
  }
  void updateBaseline()
  {
    if (numOfDataForSettling < max)
    {
      gsrBaseline = ((gsrBaseline*numOfDataForSettling) + input)/((float)(++numOfDataForSettling));
    }
  }
}
