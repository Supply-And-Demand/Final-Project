class character {
 
  PVector locCharacter, vel, acc;
  float n, xoff, xinc, sz, yoff, yinc, m;
  boolean jumping;
  PImage jump, right, left, stand;

  character(float x, float y) {
   
    locCharacter=new PVector(x, y); 
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    sz= 60;
    jumping=false;
    jump= loadImage("MegaKevJump.png");
    right= loadImage("MegaKevRight.png"); 
    left= loadImage("MegaKevLeft.png");
    stand= loadImage("MegaKevStand.png");



    xoff=0;
    xinc=.1;
    yoff=0;
    yinc=.1;
  }

  void display() {

if (keyPressed) {
      if (key=='d') { 
        image(right, locCharacter.x, locCharacter.y, sz, sz);        
      }

     else if (key=='a') {       
        image(left, locCharacter.x, locCharacter.y, sz, sz);                                                                                                                      
      }                                                                      
      else if (key=='w') {  
        image(jump, locCharacter.x, locCharacter.y, sz, sz);       
      }
      else 
       image(stand, locCharacter.x, locCharacter.y, sz, sz);  
         
    }
  
  }
  void sidekick() {

    n=map(noise(xoff), 0, 1, locCharacter.x-45, locCharacter.x-10);
    xoff+=.25*xinc;
    m=map(noise(yoff), 0, 1, locCharacter.y-45, locCharacter.y-30);
    yoff+=.25*yinc;
      ellipse(n, m, 10, 10);
  }

  void move() {

    vel.add(acc);
    locCharacter.add(vel);
    if (jumping && locCharacter.y + sz/2 >= height) {
      locCharacter.y = height -60;
      vel.y = 0;
      acc.y = 0;
      jumping = false;
    }

    if (keyPressed) {
      if (key=='d') {       
        locCharacter.x+=3;

        println("right");
      }

      if (key=='a') {             
        locCharacter.x-=3;                                                             
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
//  boolean checkIfPressed() {
//    if (key=='w'||key=='a'||key=='d') {
//      return true;
//    } else {
//      return false;
//    }
//  }
}

