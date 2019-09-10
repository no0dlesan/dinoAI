class Road{
  PImage sprite [];
  float posX [];
  float speed;
  int roadWidth = 150;
  int nOfChunks;

  
  Road(float speed,PImage [] sprite){
     this.speed = speed;
     this.sprite = sprite;
     this.nOfChunks = width/roadWidth;
    
     posX = new float [nOfChunks +20];
     
    
  }
  
void show(){  
  
  for(int i =0 ; i < nOfChunks + 20  ; i++){      
    image(sprite[nOfChunks%5+10],posX[i] + i*roadWidth,height - 17); 
    if(posX[i] + i*roadWidth <=-roadWidth)
      posX[i] = width - roadWidth/2;
  }
    
}  


void move(){
  
  for(int i =0 ; i < nOfChunks+20 ; i++){      
    posX[i] -=speed;
  }
  

}



}
