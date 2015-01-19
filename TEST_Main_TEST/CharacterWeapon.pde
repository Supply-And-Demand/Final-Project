class weapon{
  
  PVector locWeapon, velWeapon;
  PImage pencil;
  
  weapon(float x,float y){
    locWeapon= new PVector(x,y);
    velWeapon= new PVector (3,0);
       pencil= loadImage("PencilWeap.png");
  }
  
//  void attack() {
//
//    if (keyPressed) {
//      if (key=='x') {
//        image(pencil, locWeapon.x, locWeapon.y, 100, 100); 
//        locWeapon.add(velWeapon);
//      }
//    }
//  }
void display(){
  image(pencil, locWeapon.x, locWeapon.y, 100, 25); 
}

void move(){
   locWeapon.add(velWeapon); 
}
}
