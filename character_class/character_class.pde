class character {
  //////////////////////////////////////////////////////
  //                                                  //
  //        Initialized and Defined Variables         //
  //                                                  //
  //////////////////////////////////////////////////////
  PVector loc, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m;
  boolean jumping;

  character() {
    loc=new PVector(width*.1, height*.9); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 20;
    jumping=false;

    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
    
  }

  void display() {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
    ellipse(n, m, 10, 10);
  }

  void move() {
    n=map(noise(xoff), 0, 1, loc.x-45, loc.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, loc.y-45, loc.y-40);
    yoff+=.25*yinc;
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

