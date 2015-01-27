class Market {
  PImage market;
  float sz;
  Market() {
    market = loadImage("Shop.png");
  }  
  void display() {
    rect(249, 49, 702, 602);
    image(market, 250, 50, 700, 600);
    noStroke();
  }
  void shop() {
    sz = 44;
///////////////////////////////////////////////////////////
//                                                       //
//  Clinton icon displays info if mouse hovers over it   //
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=337 && mouseX<=380 && mouseY>=116 && mouseY<=159) {
      fill(0, 160);
      rect(337, 116, sz, sz);
      fill(250, 0, 0);
      text("Increases the amount of money you obtain.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
//  Easy button displays info if mouse hovers over it    //
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=337 && mouseX<=380 && mouseY>=115+sz && mouseY<=158+sz) {
      fill(0, 160);
      rect(337, 115+sz, sz, sz);
       fill(250, 0, 0);
      text("Increases the amount of ammo you have to 2.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
//    Shark icon displays info if mouse hovers over it   //
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=337 && mouseX<=380 && mouseY>=113+2*sz && mouseY<=156+2*sz) {
      fill(0, 160);
      rect(337, 113+2*sz, sz, sz);
       fill(250, 0, 0);
      text("Increases your speed when equipped.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
//  Pencil icon displays info if mouse hovers over it    //
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=337 && mouseX<=380 && mouseY>=112+3*sz && mouseY<=155+3*sz) {
      fill(0, 160);
      rect(337, 111+3*sz, sz, sz);
       fill(250, 0, 0);
      text("Increases your pencil's speed.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
//  Life icon displays info if mouse hovers over it      //
//                                                       //
///////////////////////////////////////////////////////////


    if (mouseX>=645 && mouseX<=688 && mouseY>=114 && mouseY<=157) {
      fill(0, 160);
      rect(645, 114, sz, sz);
       fill(250, 0, 0);
      text("Increases your health to full.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
//   Health icon displays info if mouse hovers over it   //
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=645 && mouseX<=688 && mouseY>=113+sz && mouseY<=156+sz) {
      fill(0, 160);
      rect(645, 113+sz, sz, sz);
       fill(250, 0, 0);
      text("Increases your health by 1.", 337, 380);
    }
///////////////////////////////////////////////////////////
//                                                       //
// Class Shirt icon displays info if mouse hovers over it//
//                                                       //
///////////////////////////////////////////////////////////

    if (mouseX>=645 && mouseX<=688 && mouseY>=114+2*sz && mouseY<=157+2*sz) {
      fill(0, 160);
      rect(645, 112+2*sz, sz, sz);
       fill(250, 0, 0);
      text("Increases ammo to 4 and doubles length.", 337, 380);
    }
  }
}

