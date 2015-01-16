boolean space;

Market market;
void setup() {
  size(1200, 700);
  market = new Market();
  space = false;
}
void draw() {
  background(255);
  if (keyPressed == true) {
    if (space == false) {    
      if (key == 'm') {
        space = true;                                  
      }
    }
    if (key == 'n') {
        space = false;
      }
    }

  if (space == true) {
    market.display();
    market.shop();
  }
}

