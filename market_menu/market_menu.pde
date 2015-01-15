Market market;
void setup(){
size(1200,700);
market = new Market();
}
void draw(){
  market.display();
  market.shop();
}
