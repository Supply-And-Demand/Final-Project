class character {
///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////
  PVector loc, locweapon, velweapon, vel, acc; //weapon as in pencil
  float n, xoff, xinc, sz, yoff, yinc, m, jumpStart, jumpHeight, sidekickidentity;
  boolean jumping, onplatform;
  PImage jump, right, left, stand, jump2, right2, left2, stand2, pencil, Bill, Shark, Button, heart;
  character(float  x, float y) {// used for character
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
    locweapon= new PVector (loc.x+50, height-40);
    velweapon= new PVector(3, 0);
    Bill= loadImage("Bill.png");
    Shark= loadImage("Shark.png");
    Button= loadImage("Button.png");
    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }
  character(float  x, float y, float tempVel, float offset, String p) { //used for the left or right pencils
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
    locweapon= new PVector (loc.x+offset, y);
    velweapon= new PVector(tempVel, 0);
    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }
///////////////////////////////////////////////////
//                                               //
//          Changes character pictures           //
//                                               //
///////////////////////////////////////////////////
  void display(float shirt) {
    if (keyPressed) {
      if (key=='d'||key=='e') { // e or d displays right move image
        if ( shirt == 0) {      // differentiate between red (=1) and blue (=2) shirt
          image(right, loc.x, loc.y, sz, sz);
        } else {
          image(right2, loc.x, loc.y, sz, sz);
        }
      } else if (key=='a'||key=='q') {       // k or q displays left move image
        if ( shirt == 0) {                    // differentiate between red (=1) and blue (=2) shirt
          image(left, loc.x, loc.y, sz, sz);
        } else {
          image(left2, loc.x, loc.y, sz, sz);
        }
      } else if (key=='w') {  // w displays jump image
        if ( shirt == 0) {    // differentiate between red (=1) and blue (=2) shirt
          image(jump, loc.x, loc.y, sz, sz);
        } else {
          image(jump2, loc.x, loc.y, sz, sz);
        }
      } else {              // any other key pressed displays him standing
        if ( shirt == 0) {  // differentiate between red (=1) and blue (=2) shirt
          image(stand, loc.x, loc.y, sz-6, sz-6);
        } else {
          image(stand2, loc.x, loc.y, sz, sz);
        }
      }
    }

    if (!keyPressed) { // nothing is pressed, he is standing
      if ( shirt == 0) {// differentiate between red (=1) and blue (=2) shirt
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
    
    if (sidekickidentity == 1) { //if sidekick 1 is bought, displays pic of Bill Clinton
      image(Bill, n, m, 20, 30);
    }
    if (sidekickidentity == 2) {//if sidekick 2 is bought, displays pic of Easy Button
      image(Button, n, m, 30, 30);
    }
    if (sidekickidentity == 3) {//if sidekick 3 is bought, displays pic of Shark
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
    if (keyPressed) {// d key moves him right by adding velocity to his location
      if (key=='d') {       
        if (sidekick == 3) {
          loc.x+=5;
        } else {
          loc.x+=3;
        }
      }
      if (key=='a') { // a key moves him left by adding velocity to his location            
        if (sidekick == 3) {
          loc.x-=5;
        } else {
          loc.x-=3;
        }                                                           
      }                                                                      
      if (key=='w') {  // w key makes him jump   
        if (!jumping) {   
          vel.y = -4;
          acc.y = .1;
          jumpStart = loc.y;
          jumping = true;
        }
      }
    }
  }

  void weapDisplay() {// diplays pencil at weapon's location
    image(pencil, locweapon.x, locweapon.y, 60, 10);
  }
  void weapMove() {// moves pencil at weapon's location by adding velocity
    locweapon.add(velweapon);
  }
  boolean edge(float penlength) { //checks edge of screen
    if (locweapon.x>loc.x+penlength||locweapon.x<0||locweapon.x<loc.x-penlength) {//200 range
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
  boolean shootEnemy(int j) { //checks if pencil hits an enemy
    if (locweapon.dist(enemyArray[j].loc)<sz/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean shootBoss() { //checks if pencil hits the boss
    if (locweapon.x > 550) {
      return true;
    } else {
      return false;
    }
  }

  void enemyCheck() {// can't move past dead enemy
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
    if (loc.x < p.loc.x || loc.x > p.loc.x + (p.w)) { //checks if character is on platform in terms of width
      float platformHeight = p.loc.y - p.h; //creates a platform height variable using platform's center and it's height
      onplatform=false;
      if (loc.y < height - sz) {
        float jumpy = jumpStart - jumpHeight;// variable for jump is top of head and the size of character
        acc.y = .1; // slowly jumps up
      } else if (!jumping) //isn't moving in y direction if not jumping
      {
        vel.y = 0;
        acc.y = 0;
      }
    } else if (loc.y <= p.loc.y - p.h && !onplatform) { //doesn't do anyting if he's not on platform or and is above platform
      acc.y = 0;
      vel.y = 0;
      loc.y = p.loc.y- p.h;
      onplatform=true;
      jumping=false;
    } else if (jumping) { 
      float jumpy = jumpStart - jumpHeight;
      if (loc.y + sz > jumpStart + jumpHeight) { //bottom of character is below top of head and size of character
        acc.y = 0;
        vel.y = 0;
        loc.y = p.loc.y - p.h;
        jumping = false;
      }
    }
  }
  boolean pass() { //detects if character is off all the way to right
    if (loc.x+sz/2>width) {
      return true;
    } else {
      return false;
    }
  }
///////////////////////////////////////////////////
//                                               //
//        Detects Second Platform                //
//         (SAME AS FIRST)                       //
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

