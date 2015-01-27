class platform {
///////////////////////////////////////////////////
//                                               //
//         Declaring variables                   //
//                                               //
///////////////////////////////////////////////////
  int w;
  int h;
  PImage platform;
  PVector loc;

  platform(float x, float y) {
///////////////////////////////////////////////////
//                                               //
//         Initializing variables                //
//                                               //
///////////////////////////////////////////////////
    platform= loadImage ("platform.png");
    loc = new PVector(x, y);
    w=200;
    h=50;
  }
  void display() {
///////////////////////////////////////////////////
//                                               //
//           displays platform                   //
//                                               //
///////////////////////////////////////////////////
    image(platform, loc.x, loc.y, w, h);
  }
}

