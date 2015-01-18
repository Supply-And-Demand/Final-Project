class platform {
  Pvector loc;
  float sz;


  platform() {
    loc=new PVector (width/2, height/2);
    sz=50;
  }

  void display() {
    rect(loc.x, loc.y, sz, sz);
  }
}

