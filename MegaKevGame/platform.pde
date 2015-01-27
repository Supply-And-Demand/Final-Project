class platform {
  int w;
  int h;
  PImage platform;
  PVector loc;

  platform(float x, float y) {
    platform= loadImage ("platform.png");
    loc = new PVector(x, y);
    w=200;
    h=50;
  }
  void display() {
    image(platform, loc.x, loc.y, w, h);
  }
}

