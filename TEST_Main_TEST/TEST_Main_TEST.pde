ArrayList<weapon> weaps= new ArrayList<weapon>();
PVector locWeapon, velWeapon;
boolean space;
int life,ammo;
PImage heart, pencil;
Market market;
Enemy e;
character c;
weapon w;

void setup() {
  size(1200, 700);
  life=3;
      heart= loadImage("Heart.png");
      pencil= loadImage("PencilWeap.png");
  e= new Enemy(random(350, 750), height-60);
  c= new character (0,height-60);
  w= new weapon(0,height-60);
   market = new Market();
  space = false;
      locWeapon= new PVector (50, height-60);
    velWeapon= new PVector(3, 0);
    ammo=3;
    

}

void draw() {
  background(0,10,30);
  


c.display();
c.move();
c.sidekick();
//if(c.attack()){
//  c.shoot();
//}

//  e.display();
//  e.move();
//e.checkForCharacter(c);
//  if (e.hit()){
//    life=life-1;
//  }
  
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

 for (int i=weaps.size ()-1; i>=0; i--) {//redraws the particles 
    weapon w= weaps.get(i);
    w.display();//calls CParticle display method
    w.move();// calls move method
 }

}

void keyPressed() {
  if(key=='x'){
  if(weaps.size() <ammo){
  weaps.add(new weapon (0, height-60));
  }
}
}

 




