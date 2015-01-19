class character {

  PVector loc, locWeapon, velWeapon, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m;
  boolean jumping;
  PImage jump, right, left, stand, pencil, Bill, heart;
  int life;

  character(float x, float y) {

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
    locWeapon= new PVector (loc.x+50, y);
    velWeapon= new PVector(3, 0);
    Bill= loadImage("Bill.png");
    life=3;



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

  void shoot() {

//    if (keyPressed) {
//      if (key=='x') {
////        image(stand, loc.x, loc.y, sz, sz); 
        image(pencil, locWeapon.x, locWeapon.y, 50, 25); 
        locWeapon.add(velWeapon);
//      }
//    }
  }
  
  boolean attack(){
    if(keyPressed&& key=='x'){
   
  
      return true;
      
    }
    else{
     return false; 
    }
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
}

