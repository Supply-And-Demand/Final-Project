class character {

  PVector loc, locWeapon, velWeapon, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m;
  boolean jumping;
  PImage jump, right, left, stand, pencil, Bill, heart;


  character(float  x, float y) {

    loc=new PVector(x, y); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 60;
    jumping=false;
    jump= loadImage("MegaKevJump.png");
    right= loadImage("MegaKevRight.png"); 
    left= loadImage("MegaKevLeft.png");
    stand= loadImage("MegaKevStand.png");
    pencil= loadImage("PencilWeap.png");
    heart= loadImage("Heart.png");
    locWeapon= new PVector (loc.x+100, height-40);
    velWeapon= new PVector(3, 0);
    Bill= loadImage("Bill.png");




    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }


  void display() {

    if (keyPressed) {
      if (key=='d') { 
        image(right, loc.x, loc.y, sz, sz);
      } else if (key=='a') {       
        image(left, loc.x, loc.y, sz, sz);
      } else if (key=='w') {  
        image(jump, loc.x, loc.y, sz, sz);
      } else {
        image(stand, loc.x, loc.y, sz, sz);
      }
    }
    if (!keyPressed) {
      image(stand, loc.x, loc.y, sz, sz);
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
    if (jumping && loc.y + sz/2 > height) {
      loc.y = height -sz;
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
  void weapDisplay() {

    image(pencil, locWeapon.x, locWeapon.y, 60, 10);
  }

  void weapMove() {
    locWeapon.add(velWeapon);
  }

  boolean edge() {
    if (locWeapon.x>width) {
      return true;
    } else {

      return false;
    }
  }
  boolean shootEnemy() {
    if (locWeapon.dist(e.loc)<sz/2) {
      return true;
    } else {
      return false;
    }
  }
  void platformCheck() {
    if (loc.dist(p.loc[0])<100/2) {//100=sz of platform
      //     loc.x=loc.x-1;
      loc.x=loc.x-5;
    }
    //     else if(loc.y+sz/2>100/2){
    //       loc.y=loc.y+50;
    //     }
  }

  //   void platformDisplay(){
  //     
  //   }
}

