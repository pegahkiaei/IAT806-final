SecondState state2;
int state = 0;
void setup() {
  size(800, 600); 
  state2 = new SecondState();
}

void draw() {
  // we need a switch case to level different states
  state2.update();//level2
  if(state == 1)println(state2.time[2]-state2.time[0], state2.time[3]-state2.time[1]);
}
