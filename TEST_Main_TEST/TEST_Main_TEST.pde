boolean space;
int life;
PImage heart;
Market market;
Enemy e;
character c;
void setup() {
  size(1200, 700);
  life=3;
      heart= loadImage("Heart.png");
  e= new Enemy(random(350, 750), height-60);
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
  if (e.hit()){
    life=life-1;
  }
  
      if (life==3) {
      image(heart, 0, 10, 50, 50);
      image(heart, 50, 10, 50, 50);
      image(heart, 100, 10, 50, 50);
    }  if (life==2) {
      image(heart, 0, 10, 50, 50);
      image(heart, 50, 10, 50, 50);
    }
    if (life==1){
       image(heart, 0, 10, 50, 50);
    }

  
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

