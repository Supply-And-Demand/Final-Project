
Enemy e;
character c;
void setup() {
  size(800, 600);
  e= new Enemy(random(350, 750), 550);
  c= new character (0,height-60);
}

void draw() {
  background(0,10,30);


c.display();
c.move();
c.sidekick();
//c.attack();
  e.display();
  e.move();
e.checkForCharacter(c);

}

