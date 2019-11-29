class Sky {
  // this class complete the backround scene based on the Pr level.
  // Inspired from https://www.openprocessing.org/sketch/494102, I want to implement multiple perlin noises and fill the sky eventually so it make it brighter
  PVector pos, vel, dir;
  float noiseScale;
  float time;
  float angle;



  Sky() 
  {
    vel = new PVector(0, 0);
    dir = new PVector(0, 0);
    this.pos = new PVector(random(0, width), random(0, height/3));
  }

  void drawClounds(float pr) 
  {
    push();
    noStroke();
    fill(5, 8, 60);

    rect(0, 0, width, 2*height/7);                                                      //Clouds background(clear the screen)
    for (int i = 0 ; i < height/2 ; i += 3) 
    {
      for (int j = 0 ; j < width ; j += 3)                                                //draw evolving clouds
      {
        noiseScale = noise(j/200., i/50., pr);
        float index = map(pr, 0, 5000, 0, 2*height/7);
        fill(70, 83, 117, noiseScale*map(i, 0, index, 255, 0)); 
        rect(j, i, 3, 3);
      }
    }
    time += 0.01;
    pop();
  }
}
