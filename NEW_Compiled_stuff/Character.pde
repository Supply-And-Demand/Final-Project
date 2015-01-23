class character {

  PVector loc, locWeapon, velWeapon, vel, acc;
   float n, xoff, xinc, sz, yoff, yinc, m, jumpStart, jumpHeight;
  boolean jumping, onplatform;
  PImage jump, right, left, stand, pencil, Bill, heart;


  character(float  x, float y) {

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
    pencil= loadImage("PencilRight.png");
    heart= loadImage("Heart.png");
    locWeapon= new PVector (loc.x+50, height-40);
    velWeapon= new PVector(3, 0);
    Bill= loadImage("Bill.png");

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
    locWeapon= new PVector (loc.x+offset, height-40);
    velWeapon= new PVector(tempVel, 0);
    Bill= loadImage("Bill.png");

    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }


  void display() {

    if (keyPressed) {
      if (key=='d'||key=='e') { 
        image(right, loc.x, loc.y, sz, sz);
      } else if (key=='a'||key=='q') {       
        image(left, loc.x, loc.y, sz, sz);
      } else if (key=='w') {  
        image(jump, loc.x, loc.y, sz, sz+10);
      }
else {
        image(stand, loc.x, loc.y, sz-10, sz);
      }
    }
    if (!keyPressed) {
      image(stand, loc.x, loc.y, sz-10, sz);
    }
  } 

  void sidekick() {

    n=map(noise(xoff), 0, 1, loc.x-45, loc.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, loc.y-45, loc.y-30);
    yoff+=.25*yinc;
    image(Bill, n, m, 20, 30);
  }


  void move() {

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
          jumpStart = loc.y;

          jumping = true;
        }
        println("up");
      }
    }
  }
  void weapDisplay() {

    image(pencil, locWeapon.x, locWeapon.y, 60, 10);
  }

  void weapMove() {
    locWeapon.add(velWeapon);
  }
  

  boolean edge() {
    if (locWeapon.x>loc.x+200||locWeapon.x<0) {
      return true;
    } else {

      return false;
    }
  }
  boolean shootEnemy() {//detects shot
    if (locWeapon.dist(e.loc)<sz/2) {
      return true;
    } else {
      return false;
    }
  }
  void enemyCheck(){//can't move over dead enemy
    if (loc.dist(e.loc)<sz/2){
     loc.x=loc.x-5; 
    }
  }
  void platformCheck() {
    if(loc.x < p.loc.x || loc.x > p.loc.x + (p.sz[0]-100)) {
        println("guyx platx " + loc.x + " " + p.loc.x);
      float platformHeight = p.loc.y - p.sz[1];
    //println ("ph/py: " + platformHeight + " " + loc.y);
       //vel.y = 0;
      //println("outside platform");
      //println("locy is " + loc.y + " jumpstart is " + jumpStart + " jumpheight is " + jumpHeight);
       onplatform=false;
      if (loc.y < height - sz) {
         float jumpy = jumpStart - jumpHeight;
        println("loc/jumpy " + loc.y + " " + jumpy);
         println("above ground");
         acc.y = .1;
       }        else if(!jumping)
        {
        vel.y = 0;
          acc.y = 0;
        }    
     }
else if (loc.y <= p.loc.y - p.sz[1] && !onplatform) {
     println("above platform");
      acc.y = 0;
      vel.y = 0;
      loc.y = p.loc.y- p.sz[1];
      onplatform=true;
      jumping=false;
    }
    else if(jumping) {
      float jumpy = jumpStart - jumpHeight;
       println("jump plat loc/jumpy " + loc.x + " " + p.loc.x);
      if(loc.y + sz > jumpStart + jumpHeight) {
      acc.y = 0;
      vel.y = 0;
      loc.y = p.loc.y - p.sz[1];
     jumping = false; }
    } 
   }

void nextlevel(){
  
}

  }
//  boolean platformXCheck(){
////       if (loc.dist(p.loc[0])<100/2) {
//  if(loc.x+sz/2>p.loc[0].x-sz/2){
//      return true;
//    } else 
//    {
//      return false;
//    }
//  }
//  boolean platformYCheck(){
//    if(loc.y+sz/2>p.loc.y-300 && loc.x+sz/2>p.loc.x-sz/2){
//       return true;
//    } else 
//    {
//      return false;
//    }
//  
//  }

  //   void platformDisplay(){
  //     
  //   }
//}

