class character {
  //////////////////////////////////////////////////////
  //                                                  //
  //        Initialized and Defined Variables         //
  //                                                  //
  //////////////////////////////////////////////////////
  PVector loc, vel, acc;
  float sz;
  boolean jumping;
  character() {
    loc=new PVector(width*.1, height*.9); 
    vel=new PVector(0,0);
    acc=new PVector(0,0);
    sz= 20;
    jumping=false;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
      if (jumping && loc.y + sz/2 >= height) {
    loc.y = height - sz/2;
    vel.y = 0;
    acc.y = 0;
    jumping = false;
  }
    if (keyPressed) {
        if (key=='d') {
          loc.x+=3;
          println("right");
        }
        if (key=='a') {
          loc.x-=3;
          println("left");
        }
        if (key=='w') {
          if (!jumping) {
    vel.y = -4;
    acc.y = .1;
    jumping = true;
  }
          println("up");
        }
      }
    }
  }


