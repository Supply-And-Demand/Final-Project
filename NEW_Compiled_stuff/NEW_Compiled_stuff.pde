ArrayList<character> weaps= new ArrayList<character>();
boolean space;
int charLife, ammo, enemyLife, game;
PImage heart, pencil, failed, title;
Market market;
Enemy e;
character c;
character w;
platform p;

void setup() {
  size(1200, 700);
  charLife=5;
  failed= loadImage("failedbackground.png");
  heart= loadImage("Heart.png");
  pencil= loadImage("PencilWeap.png");
  title= loadImage("TitleScreen.png");
  e= new Enemy(random(350, width), height-60);
  c= new character (random(0, 1), height-60);
  w= new character(random(0, 1), height-60);//weapon
  p=new platform(width/4, height-80);//platform
  market = new Market();
  space = false;
  ammo=1;
  enemyLife=2;
  game=0;
}

void draw() {
  image(title,0,0,1200,700);
  if(game==1){
  background(0, 10, 30);
  ///character///
  p.display();
  c.display();
  c.move();
  c.sidekick();
  c.platformCheck();
  c.enemyCheck();
  ///market///
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
  ////pencil////
  for (int i=weaps.size ()-1; i>=0; i--) {
    character c= weaps.get(i);
    c.weapDisplay();
 c.weapMove();

    if (c.edge()) {
      weaps.remove(i);
    }
    if (c.shootEnemy()) {
      weaps.remove(i);
      enemyLife--;
    }
  }
  /////////////enemy life///////////////////
  if (enemyLife==2) {
    e.display();
    e.move();
    e.checkForCharacter(c);
    if (e.hit()) {
      charLife=charLife-1;
    }
  }

  if (enemyLife==1) {
    e.display();
    e.move();
    e.checkForCharacter(c);
    if (e.hit()) {
      charLife=charLife-1;
    }
  }

  if (enemyLife<1) {
    c.display();
    e.dead();
  }
  
  ////////////character life/////////////////
  if (charLife==5) {
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
    image(heart, 100, 10, 50, 50);
    image(heart, 150, 10, 50, 50);
    image(heart, 200, 10, 50, 50);
  }  
  if (charLife==4) {

    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
    image(heart, 100, 10, 50, 50);
    image(heart, 150, 10, 50, 50);
  }  
  if (charLife==3) {
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
    image(heart, 100, 10, 50, 50);
  }  
  if (charLife==2) {
    image(heart, 0, 10, 50, 50);
    image(heart, 50, 10, 50, 50);
  }
  if (charLife==1) {
    image(heart, 0, 10, 50, 50);
  }

  if (charLife==0) {
    image(failed, 0, 0, width, height);
    fill(0);
    textSize(30);
    text("You have failed your classes, please close and", width/3.6, height/2) ;
    text("reopen if you would like to try again", width/3.2, height/1.8) ;
    noLoop();
  }
  }//if statment brack
}
/////add pencils//////
void keyPressed() {
  if (key=='e') {
    if (weaps.size() <ammo) {
      weaps.add(new character (c.loc.x, c.loc.y,3,50, "PencilRight"));
    }
  }
  if(key=='q'){
   if(weaps.size() <ammo){
    weaps.add(new character (c.loc.x, c.loc.y,-3,-50,"PencilLeft"));
   } 
  }
}

void mouseClicked(){
 if(mouseX>width/2-100 && mouseX<width/2+100){
   game=1; 
}
}
