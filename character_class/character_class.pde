class character {
  //////////////////////////////////////////////////////
  //                                                  //
  //        Initialized and Defined Variables         //
  //                                                  //
  //////////////////////////////////////////////////////
  PVector loc, vel, acc;
  float sz;
  character() {
    loc=new PVector(width*.1, height*.9); 
    vel=new PVector(5,5);
    acc=new PVector(0,1);
    sz= 20;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    if (keyPressed) {



        if (key=='d') {
          loc.x+=5;
          println("right");
        }

        if (key=='a') {
          loc.x-=5;
          println("left");
        }

        if (key=='w') {
          loc.y-=5;
          println("up");
        }
      }
    }
  }


