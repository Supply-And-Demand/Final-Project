Enemy e;
character c;
void setup() {
  size(800, 600);
  

  e= new Enemy(random(350, 750), 550);
  c= new character (0,height-60);
}

void draw() {
  background(0);


//if(c.checkIfPressed()){
//  c.move();
//}
//  if (!c.checkIfPressed()){
//   c.display(); 
//  
//}





c.display();
c.move();
c.sidekick();
//  e.display();
//  e.move();
//e.checkForCharacter(c);

}
