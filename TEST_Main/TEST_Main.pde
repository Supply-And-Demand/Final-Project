Enemy e;
character c;
void setup() {
  size(800, 600);

  e= new Enemy(random(350, 750), 500);
  c= new character (0,550);
}

void draw() {
  background(250);

c.display();
c.move();
  e.display();
  e.move();
e.checkForCharacter(c);
}
