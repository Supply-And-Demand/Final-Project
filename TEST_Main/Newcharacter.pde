class character {
  //////////////////////////////////////////////////////
  //                                                  //
  //        Initialized and Defined Variables         //
  //                                                  //
  //////////////////////////////////////////////////////
  PVector locCharacter, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m;
  boolean jumping;

  character(float x, float y) {
/////////////////////////////////////////////Character Variables
    locCharacter=new PVector(width*.1, height*.9); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 100;
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
    ellipse(locCharacter.x, locCharacter.y, sz, sz);
    ellipse(n, m, 10, 10);
////////////////////////////////////////////draws character  
}
  void sidekick() {
////////////////////////////////////////////makes the sidekick follow the character and hover
    n=map(noise(xoff), 0, 1, locCharacter.x-45, locCharacter.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, locCharacter.y-45, locCharacter.y-30);
    yoff+=.25*yinc;
////////////////////////////////////////////makes the sidekick follow the character and hover
  }
  void move() {

    vel.add(acc);
    locCharacter.add(vel);
    if (jumping && locCharacter.y + sz/2 >= height) {
      locCharacter.y = height - sz/2;
      vel.y = 0;
      acc.y = 0;
      jumping = false;
    }
    ////////////////////////////////////////////keys make the character move around
    if (keyPressed) {
      if (key=='d') {                                                                     
        locCharacter.x+=3;
        println("right");
      }                                                                       ///////////////////////////////////////
      if (key=='a') {                                                         //             Controls:             //
        locCharacter.x-=3;                                                             //                W                  //
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
