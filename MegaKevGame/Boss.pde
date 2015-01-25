class boss {
   PImage boss;
  PVector loc, vel;
  
  boss(float x,float y){
    boss=loadImage("Boss.png");
    loc= new PVector(x,y);
  }
  
void display(){
 image(boss, loc.x, loc.y);
}
  
  

