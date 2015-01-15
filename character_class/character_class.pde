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
/////////////////////////////////////////////Character Variables
    loc=new PVector(width*.1, height*.9); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 20;
    jumping=false;
/////////////////////////////////////////////Character Variables

////////////////////////////////////////////Initializing Sidekick Variables
    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
////////////////////////////////////////////Initializing Sidekick Variables
  }

  void display() {
////////////////////////////////////////////draws character
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
    ellipse(n, m, 10, 10);
////////////////////////////////////////////draws character  
}
  void sidekick() {
////////////////////////////////////////////makes the sidekick follow the character and hover
    n=map(noise(xoff), 0, 1, loc.x-45, loc.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, loc.y-45, loc.y-30);
    yoff+=.25*yinc;
////////////////////////////////////////////makes the sidekick follow the character and hover
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
    ////////////////////////////////////////////keys make the character move around
    if (keyPressed) {
      if (key=='d') {                                                                     
        loc.x+=3;
        println("right");
      }                                                                       ///////////////////////////////////////
      if (key=='a') {                                                         //             Controls:             //
        loc.x-=3;                                                             //                W                  //
        println("left");                                                      //              A   D                //
      }                                                                       //                                   //
      if (key=='w') {                                                         ///////////////////////////////////////
        if (!jumping) {                                                       
          vel.y = -4;
          acc.y = .1;
          jumping = true;
        }
        println("up");
      }
    }
    ////////////////////////////////////////////keys make the character move around
  }
}

