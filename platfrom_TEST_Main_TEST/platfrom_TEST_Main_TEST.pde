ArrayList<character> weaps= new ArrayList<character>();
boolean space;
int life, ammo, enemyLife;
PImage heart, pencil;
Market market;
Enemy e;
character c;
character w;
platform p;

void setup() {
  size(1200, 700);
  life=3;
  heart= loadImage("Heart.png");
  pencil= loadImage("PencilWeap.png");
  e= new Enemy(random(350, width), height-60);
  c= new character (random(0,1),height-60);
  w= new character(random(0,1),height-60);//weapon
  p=new platform(width/4, height-30);//platform
  market = new Market();
  space = false;
  ammo=3;
  enemyLife=2;
  
}

void draw() {
  background(0, 10, 30);
p.display();
  c.display();
  c.move();
  c.platformCheck();
//  c.sidekick();

//  e.display();
//  e.move();
//  e.checkForCharacter(c);
//  if (e.hit()) {
//    life=life-1;
//  }

  if (life==3) {
    c.display();
    c.sidekick();
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
    image(heart, 100, 10, 50, 50);
  }  
//  if (life==2) {
//    c.display();
//    c.sidekick();
//    image(heart, 0, 10, 50, 50);
//    image(heart, 50, 10, 50, 50);
//  }
//  if (life==1) {
//    c.display();
//    c.sidekick();
//    image(heart, 0, 10, 50, 50);
//  }
//  
//  if(life==0){
//   rect(0,0,width,height); 
//
//  }
//if(enemyLife==2){
//   e.display();
//  e.move();
//  e.checkForCharacter(c);
//  if (e.hit()) {
//    life=life-1;
//  }
//}
//
//if(enemyLife==1){
//  e.display();
//  e.move();
//  e.checkForCharacter(c);
//  if (e.hit()) {
//    life=life-1;
//  }
//}
//
//if(enemyLife==0){
//  c.display();
//}
//
//  if (keyPressed == true) {
//    if (space == false) {    
//      if (key == 'm') {
//        space = true;
//      }
//    }
//    if (key == 'n') {
//      space = false;
//    }
//  }
//
//  if (space == true) {
//    market.display();
//    market.shop();
//  }
//////pencil////
//  for (int i=weaps.size ()-1; i>=0; i--) {
//    character c= weaps.get(i);
//    c.weapDisplay();
//    c.weapMove();
//  
//
//if (c.edge()){
//     weaps.remove(i);
//}
//if(c.shootEnemy()){
// weaps.remove(i);
//enemyLife--; 
//}
//  }
//}
//
//void keyPressed() {
//  if (key=='x') {
//    if (weaps.size() <ammo) {
//      weaps.add(new character (random(0,1),height-60));
//    }
//  }
}





