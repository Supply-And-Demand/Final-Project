class platform{
int [] x={150,350,550};
int [] y={150,150,350};
int [] sz={100,200,240};

  platform(){

    
  }
 void display(){
  for(int i=0; i<x.length;i++){
  rect(x[i],y[i],sz[i],sz[i]/2);

}
 } 
  
}
