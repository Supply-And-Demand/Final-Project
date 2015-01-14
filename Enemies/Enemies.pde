Enemy e;
void setup() {
  size(800, 600);
  e= new Enemy(random(350, 750), 550);
}

void draw() {
  background(250);

  e.display();
  e.move();
  e.attack();
}


///////////////////
class Enemy {
  PVector locEnemy, locBullet, velEnemy, velBullet;
  float d;
  PImage bullet; 
//  enemy1, enemy2, enemy3,enemy4;
PImage [] enemy= new PImage[4]


  Enemy(float x, float y) {
    locEnemy= new PVector (x, y);
    velEnemy= new PVector(-1, 0);
    locBullet= new PVector (x-20, y);
    velBullet= new PVector(-3, 0);
    bullet= loadImage("bullet.png");
 
//     enemy1= loadImage("");
//     enemy2= loadImage(""); 
//     enemy3= loadImage("");
//      enemy4= loadImage("");
    d=50;
  }

  void display() {
    ellipse(locEnemy.x, locEnemy.y, d, d);
      for (int i=0; i<images.length;i++)
  }
  void move() {
    locEnemy.add(velEnemy);
  }
  void attack() {
    image(bullet, locBullet.x, locBullet.y, d-30, d-30); 
    locBullet.add(velBullet);
  }
  //
  //  void checkForCharacter(Chracterclass c) {
  //    if (loc.dist(c.loc)<d/2+c.d/2) {
  //      e.attack();
  //    }
  //  }
}

