///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////


ArrayList<character> weaps= new ArrayList<character>();
ArrayList<boss> fbombs= new ArrayList<boss>();
Enemy [] enemyArray= new Enemy [3];
boolean space;
int charLife, ammo, bossLife, game, coins, sidekick, wspeed, shirt, level, maxBombs, velbullet;
PImage heart, failed, title, points, menu;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
Market market;
character c;
character w;
platform p, p2;
boss b;


void setup() {
///////////////////////////////////////////////////
//                                               //
//         Initializing variables                //
//                                               //
///////////////////////////////////////////////////
  
  size(1200, 700);
  charLife=5;
  failed= loadImage("failedbackground.png");
  heart= loadImage("Heart.png");
  title= loadImage("TitleScreen.png");
  points= loadImage("pointsystem.png");
  menu= loadImage("menu.png");
  minim = new Minim(this);
  player = minim.loadFile("Song.wav", 2048);
  c= new character (random(0, 1), height-60);
  w= new character(random(0, 1), height-60);
  p= new platform(width/4, height-80);
  p2= new platform(width/2, height-80);
  b= new boss(width/2, height-200);
  market = new Market();
  space = false;
  ammo=1;
  bossLife= 30;
  game=0;
  sidekick = 0;
  wspeed = 3;
  shirt = 0;
  level=1;
  maxBombs= 10;
  coins = 0;
  velbullet= 200;
  for (int i = 0; i <enemyArray.length; i++) {
    enemyArray[i]  = new Enemy(random(width/2, width), height-60);
  }
}

void draw() {
  image(title, 0, 0, 1200, 700); // the title screen 
  if (game == 5) { // if the user clicks start game, then level selector screen appears
    image(menu, 0, 0, 1200, 700);
///////////////////////////////////////////////////
//                                               //
//         level seletion parameters             //
//                                               //
///////////////////////////////////////////////////
    if (mouseX > 118 && mouseX < 368 && mouseY >75 && mouseY <325) { // casual mode selection
      fill(0, 160);
      rect(118, 75, 260, 250);
      if (mousePressed == true) {
        game = 1;
      }
    }
    if (mouseX > 468 && mouseX < 728 && mouseY >75 && mouseY <325) { // plus mode selection
      fill(0, 160);
      rect(468, 75, 260, 250);
      if (mousePressed == true) {
        game = 2;
      }
    }
    if (mouseX > 811 && mouseX < 1071 && mouseY >75 && mouseY <325) { // boss battle selection
      fill(0, 160);
      rect(811, 75, 260, 262);
      if (mousePressed == true) {
        game = 3;
      }
    }
  }
  
////////////////////////////////////////////////////
//                                                //
//   casual or plus mode had been selected        //
//                                                //
////////////////////////////////////////////////////
    
  if (game>0 && game<3) { 
    if (sidekick == 2) {// button item has benefits of more ammo
      ammo=2;
    }
    if (shirt == 1) { // class shirt item has benefits of more speed on attack and more ammo
      ammo = 5;
      velbullet = 400;
    }
    player.play(); //music
    background(0, 10, 30);
    image(points, 0, 80);
    fill(255, 0, 0);
    textSize(24);
    text(coins, 112, 101);
    text("Level:" + level, width-100, 50);
    if (game == 2) {// if the game is plus mode, then maxed coins
      coins = 999;
    }
///////////////////////////////////////////////////
//                                               //
//         Game setup for casual and plus        //
//                                               //
///////////////////////////////////////////////////
    
    p.display(); //platform 1 and 2 appear
    p2.display();
    c.display(shirt);// character displays with a shirt, has a sidekick, can move, and can't go past a dead enemy unless he jumps
    c.move(); //
    c.sidekick(sidekick);
    c.enemyCheck();
    if (c.loc.x<width/2) { //character detects platform 1 on the left half of screen
      c.platformCheck();
    }
    if (c.loc.x>width/2) { //character detects platform 2 on the right half
      c.platform2Check();
    }
    if (c.pass()) {
      c.loc.x=0;
      p.loc.x= random(50, (width/2)-p.w); 
      p2.loc.x=random(width/2+p.w, width-p.w);
      level= level+1;
      for (int i = 0; i <enemyArray.length; i++) {
        enemyArray[i]  = new Enemy(random(width/2, width), height-60);
      }
    }
///////////////////////////////////////////////////
//                                               //
//             Calling the market                //
//                                               //
///////////////////////////////////////////////////   
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
///////////////////////////////////////////////////
//                                               //
//     Character shooting pencils (weapons)      //
//                                               //
///////////////////////////////////////////////////  
    for (int i=weaps.size ()-1; i>=0; i--) { //the pencil displays and moves
      character c= weaps.get(i);
      c.weapDisplay();
      c.weapMove();

      if (c.edge(velbullet)) { //if the pencil hits the left or right of screen, it is removed and added back into ammo
        weaps.remove(i);
      }

      for (int j = 0; j < enemyArray.length; j++) { //if the pencil hits the enemy, it is removeed and added back into ammo
        if (c.shootEnemy(j) && weaps.size() > 0) {
          weaps.remove(i);
          enemyArray[j].Life--; //the enemy's life depletes by one
          if (enemyArray[j].Life==0) { //if the enemy hs no more life, user earns coins (extra credit)
            if (sidekick==1) { //if Bill Clinton is equipped, user gets 5 coins benefit
              coins+=5;
            } else { //if Bill isn't equipped, user gets 2 coins
              coins+=2;
            }
          }
        }
      }
    }
///////////////////////////////////////////////////
//                                               //
//               Enemy details                   //
//                                               //
///////////////////////////////////////////////////  
    for (int i = 0; i < enemyArray.length; i++) {

      if (enemyArray[i].Life<1) { //if the enemy has no life, he looks dead and can't shoot 
        enemyArray[i].dead();
        enemyArray[i].bullsz=0;
      } else {                     // if the enemy has life, he will look alive, move, and shoot
        enemyArray[i].display();
        enemyArray[i].move();
        enemyArray[i].checkForCharacter(c); 
        if (enemyArray[i].hit()) { //if an enemy's bomb hits the character, character's life depletes by one and the bomb resets 
          charLife=charLife-1;
          enemyArray[i].locBullet.x=enemyArray[i].loc.x+50;
          enemyArray[i].velBullet.x=-2;
        }
      }
    }
///////////////////////////////////////////////////
//                                               //
//       Character health (hearts) display       //
//                                               //
///////////////////////////////////////////////////   
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
      game = 10; //you died
    }
    if (space == true) {
      if (mouseX>=337 && mouseX<=380 && mouseY>=116 && mouseY<=159 && coins > 9) {
        if (mousePressed == true) {
          sidekick = 1; 
          coins-= 10;
        }
      }
      if (mouseX>=337 && mouseX<=380 && mouseY>=159 && mouseY<=202 && coins > 9) {
        if (mousePressed == true) {
          sidekick = 2; 
          coins-= 10;
        }
      }
      if (mouseX>=337 && mouseX<=380 && mouseY>=203 && mouseY<=246 && coins > 9) {
        if (mousePressed == true) {
          sidekick = 3; 
          coins-= 10;
        }
      }
      if (mouseX>=337 && mouseX<=380 && mouseY>=247 && mouseY<=290 && coins > 14) {
        if (mousePressed == true) {
          wspeed += 3;
          coins -= 15;
        }
      }
      if (mouseX>=645 && mouseX<=688 && mouseY>=157 && mouseY<=200 && coins > 4 && charLife < 5) {
        if (mousePressed == true) {
          charLife += 1; 
          coins-= 5;
        }
      }
      if (mouseX>=645 && mouseX<=688 && mouseY>=114 && mouseY<=157  && coins > 14 && charLife < 5) {
        if (mousePressed == true) {
          charLife = 5; 
          coins-= 15;
        }
      }
      if (mouseX>=645 && mouseX<=688 && mouseY>=202 && mouseY<=245  && coins > 99) {
        if (mousePressed == true) {
          shirt = 1;
          coins-= 100;
        }
      }
    }
  } 
///////////////////////////////////////////////////
//                                               //
//          Game setup for Boss Battle           //
//                                               //
///////////////////////////////////////////////////
  if (game== 3) {
    background(0, 10, 30);
    image(points, 0, 80);
    fill(255, 0, 0);
    textSize(24);
    text(coins, 112, 101);
    if (fbombs.size() <maxBombs) {
      fbombs.add(new boss (700, 400));
    }
    if (bossLife>0) {
      b.display();
    }
    for (int i=fbombs.size ()-1; i>=0; i--) {
      boss f = fbombs.get(i);
      if (bossLife>0) {

        f.BulletMove();
        f.BulletDisplay();
        if (f.hit()) {
          charLife--;
        }
      }
      if (bossLife<1) {
        textSize(80);
        text("YOU WIN", width/2-120, height/2);
      }
    }
    player.play();
    c.display(shirt);
    c.move();
    c.sidekick(sidekick);
    c.enemyCheck();

    if (c.loc.x > 550) {
      c.loc.x=550;
    }
    if (c.loc.x < 0) {
      c.loc.x=0;
    }
///////////////////////////////////////////////////
//                                               //
//       Character health (hearts) display       //
//                                               //
///////////////////////////////////////////////////   

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
      game = 10; //you died
    }
    for (int i=weaps.size ()-1; i>=0; i--) {
      character c= weaps.get(i);
      c.weapDisplay();
      c.weapMove();

      if (c.edge(800)) {
        weaps.remove(i);
      }
      if (c.shootBoss()) {
        weaps.remove(i);
        fill(0, 120);
        rect(600, 200, 600, 500);
        bossLife -= 1;
      }
      if (bossLife==0) {
        coins+=1000;
      }
    }
  }
///////////////////////////////////////////////////
//                                               //
//                death screen                   //
//                                               //
///////////////////////////////////////////////////
  if (game == 10) {
    image(failed, 0, 0, width, height);
    fill(0);
    textSize(30);
    text("You have failed your classes, please press", width/3.6, height/2) ;
    text("R if you would like to try again", width/3.2, height/1.8) ;
    if (keyPressed == true) {
      if (key == 'r') {
        charLife = 5;  
        ammo=1;
        bossLife= 30;
        sidekick = 0;
        shirt = 0;
        level=1;
        coins = 0;
        wspeed = 3;
        for (int i = 0; i <enemyArray.length; i++) {
          enemyArray[i]  = new Enemy(random(width/2, width), height-60);
        }
        game = 0;
      }
    }
  }
}

void mouseClicked() {
  if (game == 0) {
    game = 5;
  }
}

void keyPressed() {
///////////////////////////////////////////////////
//                                               //
//       Determining pencil orientation          //
//                                               //
///////////////////////////////////////////////////
  if (key=='e') {
    if (weaps.size() <ammo) { //if the user has ammo, the charcter class has the parameters for shooting RIGHT
      if (c.loc.y<p.loc.y-p.h/2) { //pencil shoots at higher point because he's on platform
        weaps.add(new character (c.loc.x, height-100, wspeed, 50, "PencilRight"));
      } else {
        weaps.add(new character (c.loc.x, height-40, wspeed, 50, "PencilRight"));
      }
    }
  }
  if (key=='q') { 
    if (weaps.size() <ammo) { //if the user has ammo, the charcter class has the parameters for shooting LEFT
      if (c.loc.y<p.loc.y-p.h/2) {//pencil shoots at higher point because he's on platform
        weaps.add(new character (c.loc.x, height-100, -wspeed, -50, "PencilLeft"));
      } else {
        weaps.add(new character (c.loc.x, height-40, -wspeed, -50, "PencilLeft"));
      }
    }
  }
///////////////////////////////////////////////////
//                                               //
//           controling the music                //
//                                               //
///////////////////////////////////////////////////
  if (key == 'l') {
    player.close();
  }
  if (key == 'k') {
    player.rewind();
  }
}

