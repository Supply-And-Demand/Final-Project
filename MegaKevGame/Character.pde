class character {
///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////
  PVector loc, locWeapon, velWeapon, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m, jumpStart, jumpHeight, sidekickidentity;
  boolean jumping, onplatform;
  PImage jump, right, left, stand, jump2, right2, left2, stand2, pencil, Bill, Shark, Button, heart;
  character(float  x, float y) {
///////////////////////////////////////////////////
//                                               //
//       Initializing tons of variables          //
//                                               //
///////////////////////////////////////////////////
    loc=new PVector(x, y); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 60;
    jumpStart = height - sz;
    jumpHeight = 60;
    jumping=false;
    onplatform=false;
    jumping=false;
    jump= loadImage("MegaKevJumpRed.png");
    right= loadImage("MegaKevRightRed.png"); 
    left= loadImage("MegaKevLeftRed.png");
    stand= loadImage("MegaKevStandRed.png");
    jump2= loadImage("MegaKevJumpBlue.png");
    right2= loadImage("MegaKevRightBlue.png"); 
    left2= loadImage("MegaKevLeftBlue.png");
    stand2= loadImage("MegaKevStandBlue.png");
    pencil= loadImage("PencilRight.png");
    heart= loadImage("Heart.png");
    locWeapon= new PVector (loc.x+50, height-40);
    velWeapon= new PVector(3, 0);
    Bill= loadImage("Bill.png");
    Shark= loadImage("Shark.png");
    Button= loadImage("Button.png");
    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }
  character(float  x, float y, float tempVel, float offset, String p) { //left or right
    loc=new PVector(x, y); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 60;
    jumpStart = height - sz;
    jumpHeight = 60;
    jumping=false;
    onplatform=false;
    jumping=false;
    jump= loadImage("MegaKevJumpRed.png");
    right= loadImage("MegaKevRightRed.png"); 
    left= loadImage("MegaKevLeftRed.png");
    stand= loadImage("MegaKevStandRed.png");
    pencil= loadImage(p+".png");
    heart= loadImage("Heart.png");
    locWeapon= new PVector (loc.x+offset, y);
    velWeapon= new PVector(tempVel, 0);
    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }
///////////////////////////////////////////////////
//                                               //
//      Changes character pic when moving        //
//                                               //
///////////////////////////////////////////////////
  void display(float shirt) {
    if (keyPressed) {
      if (key=='d'||key=='e') { 
        if ( shirt == 0) {
          image(right, loc.x, loc.y, sz, sz);
        } else {
          image(right2, loc.x, loc.y, sz, sz);
        }
      } else if (key=='a'||key=='q') {       
        if ( shirt == 0) {
          image(left, loc.x, loc.y, sz, sz);
        } else {
          image(left2, loc.x, loc.y, sz, sz);
        }
      } else if (key=='w') {  
        if ( shirt == 0) {
          image(jump, loc.x, loc.y, sz, sz);
        } else {
          image(jump2, loc.x, loc.y, sz, sz);
        }
      } else {
        if ( shirt == 0) {
          image(stand, loc.x, loc.y, sz-6, sz-6);
        } else {
          image(stand2, loc.x, loc.y, sz, sz);
        }
      }
    }
///////////////////////////////////////////////////
//                                               //
//      keeps normal character pic when still    //
//                                               //
///////////////////////////////////////////////////
    if (!keyPressed) {
      if ( shirt == 0) {
        image(stand, loc.x, loc.y, sz-6, sz-6);
      } else {
        image(stand2, loc.x, loc.y, sz, sz);
      }
    }
  } 
///////////////////////////////////////////////////
//                                               //
//         Creates a cool sidekick               //
//                                               //
///////////////////////////////////////////////////
  void sidekick(float sidekickidentity) {
    n=map(noise(xoff), 0, 1, loc.x-45, loc.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, loc.y-45, loc.y-30);
    yoff+=.25*yinc;
///////////////////////////////////////////////////
//                                               //
//      Depending on which sidekick you buy      //
//                                               //
///////////////////////////////////////////////////
    if (sidekickidentity == 1) {
      image(Bill, n, m, 20, 30);
    }
    if (sidekickidentity == 2) {
      image(Button, n, m, 30, 30);
    }
    if (sidekickidentity == 3) {
      image(Shark, n, m, 80, 30);
    }
  }
  void move() {
///////////////////////////////////////////////////
//                                               //
//         Character can move and jump!          //
//                                               //
///////////////////////////////////////////////////
    vel.add(acc);
    loc.add(vel);
    if (jumping && loc.y + sz > height) {
      loc.y = height - sz;
      vel.y = 0;
      acc.y = 0;
      jumping = false;
    }
    if (keyPressed) {
      if (key=='d') {       
        if (sidekick == 3) {
          loc.x+=5;
        } else {
          loc.x+=3;
        }
      }
      if (key=='a') {             
        if (sidekick == 3) {
          loc.x-=5;
        } else {
          loc.x-=3;
        }                                                           
      }                                                                      
      if (key=='w') {        
        if (!jumping) {   
          vel.y = -4;
          acc.y = .1;
          jumpStart = loc.y;
          jumping = true;
        }
      }
    }
  }
///////////////////////////////////////////////////
//                                               //
//      Pencil Weapon is made and can be shot    //
//                                               //
///////////////////////////////////////////////////
  void weapDisplay() {
    image(pencil, locWeapon.x, locWeapon.y, 60, 10);
  }
  void weapMove() {
    locWeapon.add(velWeapon);
  }
  boolean edge(float penlength) {
    if (locWeapon.x>loc.x+penlength||locWeapon.x<0||locWeapon.x<loc.x-penlength) {//200 range
      return true;
    } else {
     return false;
    }
  }
///////////////////////////////////////////////////
//                                               //
//      Pencil can damage enemies and boss       //
//                                               //
///////////////////////////////////////////////////
  boolean shootEnemy(int j) {
    if (locWeapon.dist(enemyArray[j].loc)<sz/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean shootBoss() {
    if (locWeapon.x > 550) {
      return true;
    } else {
      return false;
    }
  }
///////////////////////////////////////////////////
//                                               //
//        Can't move past a dead enemy           //
//                                               //
///////////////////////////////////////////////////
  void enemyCheck() {
    for (int j = 0; j < enemyArray.length; j++) {
      if (loc.dist(enemyArray[j].loc)<sz/2) {
        loc.x=loc.x-5;
      }
    }
  }
///////////////////////////////////////////////////
//                                               //
//         Detects First Platform                //
//                                               //
///////////////////////////////////////////////////
  void platformCheck() {
    if (loc.x < p.loc.x || loc.x > p.loc.x + (p.w)) {
      float platformHeight = p.loc.y - p.h;
      onplatform=false;
      if (loc.y < height - sz) {
        float jumpy = jumpStart - jumpHeight;
        acc.y = .1;
      } else if (!jumping)
      {
        vel.y = 0;
        acc.y = 0;
      }
    } else if (loc.y <= p.loc.y - p.h && !onplatform) {
      acc.y = 0;
      vel.y = 0;
      loc.y = p.loc.y- p.h;
      onplatform=true;
      jumping=false;
    } else if (jumping) {
      float jumpy = jumpStart - jumpHeight;
      if (loc.y + sz > jumpStart + jumpHeight) {
        acc.y = 0;
        vel.y = 0;
        loc.y = p.loc.y - p.h;
        jumping = false;
      }
    }
  }
  boolean pass() {
    if (loc.x+sz/2>width) {
      return true;
    } else {
      return false;
    }
  }
///////////////////////////////////////////////////
//                                               //
//        Detects Second Platform                //
//                                               //
///////////////////////////////////////////////////
   void platform2Check() {
    if (loc.x < p2.loc.x || loc.x > p2.loc.x + (p2.w)) {  
      float platform2Height = p2.loc.y - p2.h;
      onplatform=false;
      if (loc.y < height - sz) {
        float jumpy2 = jumpStart - jumpHeight;
        acc.y = .1;
      } else if (!jumping){
        vel.y = 0;
        acc.y = 0;
      }
    } else if (loc.y <= p2.loc.y - p2.h && !onplatform) {
      acc.y = 0;
      vel.y = 0;
      loc.y = p2.loc.y- p2.h;
      onplatform=true;
      jumping=false;
    } else if (jumping) {
      float jumpy2 = jumpStart - jumpHeight;
      if (loc.y + sz > jumpStart + jumpHeight) {
        acc.y = 0;
        vel.y = 0;
        loc.y = p2.loc.y - p2.h;
        jumping = false;
      }
    }
  }
}

