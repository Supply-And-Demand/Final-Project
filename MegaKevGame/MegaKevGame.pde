ArrayList<character> weaps= new ArrayList<character>();
//ArrayList<Enemy> ens= new ArrayList<Enemy>();
Enemy [] enemyArray= new Enemy [3];
//ArrayList<platform> plats= new ArrayList<platform>();
//platform [] p= new platform [2];
boolean space;
int charLife, ammo, enemyLife, game, coins, sidekick, weospeed, shirt, level;
PImage heart, failed, title, points;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
Market market;
Enemy e;
character c;
character w;
platform p, p2;


void setup() {
  size(1200, 700);
  charLife=5;
  failed= loadImage("failedbackground.png");
  heart= loadImage("Heart.png");
  title= loadImage("TitleScreen.png");
  points= loadImage("pointsystem.png");
  minim = new Minim(this);
  player = minim.loadFile("Song.wav", 2048);
  e= new Enemy(random(350, width), height-60);
  c= new character (random(0, 1), height-60);
  w= new character(random(0, 1), height-60);//weapon
  p= new platform(width/4, height-80);//platform
  p2= new platform(width/2, height-100);
  market = new Market();
  space = false;
  ammo=1;
  enemyLife=2;
  game=0;
  coins = 0;
  sidekick = 0;
  weospeed = 3;
  shirt = 0;
  level=0;
}

void draw() {
  image(title, 0, 0, 1200, 700);
  if (game==1) {
    player.play();
    background(0, 10, 30);
    image(points, 0, 80);
    fill(255, 0, 0);
    textSize(24);
    text(coins, 112, 101);
    ///character///

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
      p.loc.x= random(50, (width/2)-1); 
      p2.loc.x= random(width/2, width-p2.h);
      level= level+1;
      println(level);
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

      if (c.edge()) {
        weaps.remove(i);
      }
      if (c.shootEnemy()) {
        weaps.remove(i);
        enemyLife--;
        if (enemyLife==0) {
          coins+=10;
        }
      }
    }
    /////////////enemy life///////////////////
    ///enemy////
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
      e.dead();
      Enemy e2= new Enemy (width, height-60);
      e2.display();
      e2.move();
    }

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
    //////////////////////////////////////////////////////////////////
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
      if (mouseX>=645 && mouseX<=688 && mouseY>=202 && mouseY<=245  && coins > 14) {
        if (mousePressed == true) {
          shirt = 1;
          coins-= 15;
        }
      }
    }
    ////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////MARKET UPWARD CAUTION////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
  } //if statement Game == 1
}
void mouseClicked() {
  if (mouseX>0 && mouseX<width) {
    game=1;
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

