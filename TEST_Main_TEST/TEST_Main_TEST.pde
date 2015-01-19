ArrayList<character> weaps= new ArrayList<character>();
boolean space;
int life, ammo;
PImage heart, pencil;
Market market;
Enemy e;
character c;
character w;

void setup() {
  size(1200, 700);
  life=3;
  heart= loadImage("Heart.png");
  pencil= loadImage("PencilWeap.png");
  e= new Enemy(random(350, 750), height-60);
  c= new character (0, height-60);
  w= new character(0, height-60);
  market = new Market();
  space = false;
  ammo=3;
  
}

void draw() {
  background(0, 10, 30);

  c.display();
  c.move();
  c.sidekick();

//  e.display();
//  e.move();
//  e.checkForCharacter(c);
//  if (e.hit()) {
//    life=life-1;
//  }

  if (life==3) {
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
    image(heart, 100, 10, 50, 50);
  }  
  if (life==2) {
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
  }
  if (life==1) {
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

  for (int i=weaps.size ()-1; i>=0; i--) {
    character w= weaps.get(i);
    c.weapDisplay();
    c.weapMove();
  }
}

void keyPressed() {
  if (key=='x') {
    if (weaps.size() <ammo) {
      weaps.add(new character (50, height-60));
    }
  }
}





