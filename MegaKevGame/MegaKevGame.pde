ArrayList<character> weaps= new ArrayList<character>();
ArrayList<boss> fbombs= new ArrayList<boss>();
//ArrayList<Enemy> ens= new ArrayList<Enemy>();
Enemy [] enemyArray= new Enemy [3];
boolean space;
int charLife, ammo, bossLife, game, coins, sidekick, weospeed, shirt, level, maxBombs;
PImage heart, failed, title, points, menu;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
Market market;
//Enemy e;
character c;
character w;
platform p, p2;
boss b;


void setup() {
  size(1200, 700);
  charLife=5;
  failed= loadImage("failedbackground.png");
  heart= loadImage("Heart.png");
  title= loadImage("TitleScreen.png");
  points= loadImage("pointsystem.png");
  menu= loadImage("menu.png");
  minim = new Minim(this);
  player = minim.loadFile("Song.wav", 2048);
  //  e= new Enemy(random(350, width), height-60);
  c= new character (random(0, 1), height-60);
  w= new character(random(0, 1), height-60);//weapon
  p= new platform(width/4, height-80);//platform
  p2= new platform(width/2, height-80);
  b= new boss(width/2, height-200);
  market = new Market();
  space = false;
  ammo=1;
  bossLife= 50;
  game=0;
  sidekick = 0;
  weospeed = 3;
  shirt = 0;
  level=1;
  maxBombs= 10;
  coins = 0;
  for (int i = 0; i <enemyArray.length; i++) {
    enemyArray[i]  = new Enemy(random(width/2, width), height-60);
  }
}

void draw() {
  image(title, 0, 0, 1200, 700);
  if (game == 5) {
    image(menu, 0, 0, 1200, 700);
    if (mouseX > 118 && mouseX < 368 && mouseY >75 && mouseY <325) {
      fill(0, 160);
      rect(118, 75, 260, 250);
      if (mousePressed == true) {
        game = 1;
      }
    }
    if (mouseX > 468 && mouseX < 728 && mouseY >75 && mouseY <325) {
      fill(0, 160);
      rect(468, 75, 260, 250);
      if (mousePressed == true) {
        game = 2;
      }
    }
    if (mouseX > 811 && mouseX < 1071 && mouseY >75 && mouseY <325) {
      fill(0, 160);
      rect(811, 75, 260, 262);
      if (mousePressed == true) {
        game = 3;
      }
    }
  }
  if (game>0 && game<3) {
    if (shirt == 1) {
      ammo = 4;
    }
    player.play();
    background(0, 10, 30);
    image(points, 0, 80);
    fill(255, 0, 0);
    textSize(24);
    text(coins, 112, 101);
    text("Level:" + level, width-100, 50);
    ///character///
    if (game == 2) {
      coins = 999;
    }
    p.display();
    p2.display();
    c.display(shirt);
    c.move();
    c.sidekick(sidekick);
    c.enemyCheck();
    /////platforms////
    if (c.loc.x<width/2) {
      c.platformCheck();
    }
    if (c.loc.x>width/2) {
      c.platform2Check();
    }

    /////advance to levels/////

    if (c.pass()) {
      c.loc.x=0;
      p.loc.x= random(50, (width/2)-p.w); 
      //      p2.loc.x= random(width/2, width-p2.w);
      p2.loc.x=random(width/2+p.w, width-p.w);//000000
      level= level+1;
      for (int i = 0; i <enemyArray.length; i++) {
        enemyArray[i]  = new Enemy(random(width/2, width), height-60);
      }
      //      level= level+1;
    }
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

      if (c.edge(200)) {
        weaps.remove(i);
      }
      //////
      for (int j = 0; j < enemyArray.length; j++) {
        if (c.shootEnemy(j) && weaps.size() > 0) {
          weaps.remove(i);
          enemyArray[j].Life--;
          if (enemyArray[j].Life==0) {
            if (sidekick==1) {
              coins+=10;
            } else { 
              coins+=5;
            }
          }
        }
      }
    }
    /////////////enemy life///////////////////
    ///enemy////
    for (int i = 0; i < enemyArray.length; i++) {

      if (enemyArray[i].Life<1) {
        enemyArray[i].dead();
        enemyArray[i].bsz=0;
      } else {
        enemyArray[i].display();
        enemyArray[i].move();
        enemyArray[i].checkForCharacter(c);
        if (enemyArray[i].hit()) {
          charLife=charLife-1;
          enemyArray[i].locBullet.x=enemyArray[i].loc.x;
          enemyArray[i].velBullet.x=-2;
        }
      }
    }//for

    ///////////////////////////////////////////////////////////
    ////////////////character life////////////////////
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
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////MARKET BELOW CAUTION/////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
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
          weospeed += 3;
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
    ////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////MARKET UPWARD CAUTION////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
  } //if statement Game == 1



  /////////////////////////////////////////////////
  /////////////////boss battle/////////////////////
  /////////////////////////////////////////////////
  if (game== 3) { ///=3?
    background(0, 10, 30);
    image(points, 0, 80);
    fill(255, 0, 0);
    textSize(24);
    text(coins, 112, 101);
    if (fbombs.size() <maxBombs) {
      fbombs.add(new boss (700, 400));
    }
    if(bossLife>0){
  b.display();
    }
    for (int i=fbombs.size ()-1; i>=0; i--) {//redraws the particles 
      boss f = fbombs.get(i);
      if (bossLife>0) {
      
        f.BulletMove();
        f.BulletDisplay();
        if (f.hit()) {
          charLife--;
        }
      }
      if(bossLife<1){
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

    ////pencil & boss sheet////
    for (int i=weaps.size ()-1; i>=0; i--) {
      character c= weaps.get(i);
      c.weapDisplay();
      c.weapMove();

      if (c.edge(800)) {
        weaps.remove(i);
      }
      if (c.shootBoss()) {
        weaps.remove(i);
        fill(0,120);
         rect(600,200, 600, 500);
        bossLife -= 1;
      }
      if (bossLife==0) {
        coins+=1000;
      }
    }
  }//end of game 3
}///end of void draw
void mouseClicked() {
  if (game == 0) {
    game = 5;
  }
}

/////add pencils//////
void keyPressed() {
  if (key=='e') {
    if (weaps.size() <ammo) {
      if (c.loc.y<p.loc.y-p.h/2) {
        weaps.add(new character (c.loc.x, height-100, weospeed, 50, "PencilRight"));
      } else {
        weaps.add(new character (c.loc.x, height-40, weospeed, 50, "PencilRight"));
      }
    }
  }
  if (key=='q') {
    if (weaps.size() <ammo) {
      if (c.loc.y<p.loc.y-p.h/2) {
        weaps.add(new character (c.loc.x, height-100, -weospeed, -50, "PencilLeft"));
      } else {
        weaps.add(new character (c.loc.x, height-40, -weospeed, -50, "PencilLeft"));
      }
    }
  }
  if (key == 'l') {
    player.close();
  }
  if (key == 'k') {
    player.rewind();
  }
}

