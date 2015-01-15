class character {
  //////////////////////////////////////////////////////
  //                                                  //
  //        Initialized and Defined Variables         //
  //                                                  //
  //////////////////////////////////////////////////////
  PVector loc, vel, acc;
  float n, xoff, xinc, sz;
  boolean jumping;

  character(float x, float y) {
    loc=new PVector(width*.1, height*.9); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 20;
    jumping=false;
    n=map(noise(xoff),0,1,loc.x-25,loc.x-20);
    xoff=0;
    xinc=.1;
    xoff+=xinc;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
    ellipse(n, loc.y, 20, 20);
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
