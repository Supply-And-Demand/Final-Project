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
    velbomb= new PVector(random(-4, -3), random(0, 4));
    sz=50;
  }

  void display() { //displays boss
    image(boss, 600, 200, 600, 500);
  }

  void bombMove() {// moves bomb location by velocity
    locbomb.add(velbomb);
    if (locbomb.x<0||locbomb.x>width||locbomb.y+35/2>height|| locbomb.y<0) { //checks if bomb is touching edges and resets it
      locbomb.x=random(600, 800);
      locbomb.y= random(400, 600);
    }
  }
  void bombDisplay() { //displays bomb

    image(bomb, locbomb.x, locbomb.y, sz-15, sz-15);
  }
  boolean hit() {//detcts if bomb hitts character

    if (locbomb.dist(c.loc)<sz/2) {
      locbomb.x=700;
      locbomb.y= 400;
      return true;
    } else {
      return false;
    }
  }
}

