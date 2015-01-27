class boss {
///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////
  PImage boss, bomb;
  PVector loc, vel, locbomb, velbomb;
  int sz;

  boss(float x, float y) {
///////////////////////////////////////////////////
//                                               //
//         Initializing variables                //
//                                               //
///////////////////////////////////////////////////
    boss=loadImage("Boss.png");
    bomb= loadImage("bullet.png");
    loc= new PVector(x, y);
    locbomb= new PVector (x, y);
    velbomb= new PVector(random(-4, -3), random(0,4));
    sz=50;
  }

  void display() {
    image(boss, 600, 200, 600, 500);
  }

  void bombMove() {
///////////////////////////////////////////////////
//                                               //
//         Boss weapon discharging               //
//                                               //
///////////////////////////////////////////////////
    locbomb.add(velbomb);
    if (locbomb.x<0||locbomb.x>width||locbomb.y+35/2>height|| locbomb.y<0) {
      println("yes");
      locbomb.x=random(600,800);
      locbomb.y= random(400,600);
    }
  }
  void bombDisplay() {

    image(bomb, locbomb.x, locbomb.y, sz-15, sz-15); 
  }
  boolean hit() {
///////////////////////////////////////////////////
//                                               //
//                detects bullet                 //
//                                               //
///////////////////////////////////////////////////
    if (locbomb.dist(c.loc)<sz/2){
      println("no");
      locbomb.x=700;
      locbomb.y= 400;
      return true;
    } else {
      return false;
    }
  }
}
