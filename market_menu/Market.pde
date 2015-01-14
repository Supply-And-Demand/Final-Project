class Market {
  PImage market;
  Market(){
    market = loadImage("Shop.png");
  }
  void display(){
    rect(99,99,401,401);
    image(market,100,100,400,400);
  }
}
  
 
