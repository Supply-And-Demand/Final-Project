character character;


void setup(){
 size(800,600);
 character = new character();
}

void draw(){
 background(0);
character.display();
character.move();
character.sidekick();
}
