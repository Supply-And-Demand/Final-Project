boolean space;

Market market;
Enemy e;
character c;
void setup() {
  size(1200, 700);
  e= new Enemy(random(350, 750), 550);
  c= new character (0,height-60);
   market = new Market();
  space = false;
}

void draw() {
  background(0,10,30);


c.display();
c.move();
c.sidekick();
c.attack();
  e.display();
  e.move();
e.checkForCharacter(c);

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

