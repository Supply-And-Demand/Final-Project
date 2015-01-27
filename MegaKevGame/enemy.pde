class Enemy {
///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////
  PVector loc, vel, locbullet, velbullet; // bullet as in eemy bombs
  float sz, bullsz, imagerunning, time;
  PImage bullet, enemy1, enemy2, enemy3, enemy4, enemyDead;
  int Life;

  Enemy(float x, float y) {
///////////////////////////////////////////////////
//                                               //
//        Initializing variables                 //
//                                               //
///////////////////////////////////////////////////
    loc= new PVector (x, y);
    vel= new PVector(-1, 0);
    locbullet= new PVector (x, y);
    velbullet= new PVector(-2, 0);
    bullet= loadImage("bullet.png");
    enemy1= loadImage("Enemy1.png");
    enemy2= loadImage("Enemy2.png"); 
    enemy3= loadImage("Enemy3.png");
    enemy4= loadImage("Enemy4.png");
    enemyDead= loadImage("deadrobot.png");
    imagerunning=1;
    sz=50;
    bullsz=35;
    time=1;
    Life=3;
  }

  void display() {//displays enemy animation
    time +=1;
    if (time>0 && time<11) { //changes pic at certain time intervals
      image(enemy1, loc.x, loc.y);
    }
    if (time>10 && time<21) {
      image(enemy2, loc.x, loc.y);
    }
    if (time>20 && time<31) {
      image(enemy3, loc.x, loc.y);
    }
    if (time>30 && time<41) {
      image(enemy4, loc.x, loc.y);
    }
    if (time>40) {
      time = 1;
    }
  }
  void move() { //enemy moves
    loc.add(vel);
  }
  void attack() {//enemy shoots and displays bombs
    image(bullet, locbullet.x-50, locbullet.y, bullsz, bullsz); 
    locbullet.add(velbullet);
    if (locbullet.x<0) {
      locbullet.x=loc.x;
      velbullet.x=-2;
    }
  }

  boolean hit() {//checks if enemy bomb hits character
    if (locbullet.dist(c.loc)<sz/2) {
      return true;
    } else {
      return false;
    }
  }
  void dead() {//displays dead enemy pic
    image(enemyDead, loc.x, loc.y+20);
  }

  void checkForCharacter(character c) {//  Enemy detects when you are near and shoots
    for (int j = 0; j <enemyArray.length; j++) {
      if (loc.dist(c.loc)<500) {
        enemyArray[j].attack();
      }
    }
  }
}

