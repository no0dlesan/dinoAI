class Obstacle{

PImage sprite [];
int obsWidth;
int obsHeight;
float posX = width;
float speed;
float margin ;
float size =20;
int type;
int smallCactuses;


float colX;
float colY;



Obstacle(int type,float speed, PImage [] sprite){
  
  this.type = type;
  this.speed = speed; 
  this.sprite = sprite;
  
  switch(type){
    case 0:
      obsWidth = 17;
      obsHeight = 35;
      smallCactuses = floor(random(3));
      break;
    case 1: //pair of cactuses
      obsWidth = 24;
      obsHeight = 47;
      break;
    case 2: //big cactus
      obsWidth = 24;
      obsHeight = 47;
      break;
  
  }
  

 


}



void show(){
  stroke(255,0,0);
  
    if(type == 0){
      
      int smallWidth = 17;
      
      colX = posX - smallWidth*smallCactuses;
      colY = height - 10 - obsHeight;
      obsWidth = smallWidth*(smallCactuses+1);
      
      
      switch(smallCactuses){        
        
        case 0:
          rect(colX,colY,obsWidth,obsHeight); 
          image(sprite[type],colX,colY); 
          break;
        case 1:          
          rect(colX,colY,obsWidth,obsHeight);          
          image(sprite[type],posX,colY); 
          image(sprite[type],posX - smallWidth,colY); 
          break;
        case 2:
          rect(colX,colY,obsWidth,obsHeight);         
          image(sprite[type],posX,colY); 
          image(sprite[type],posX - smallWidth,colY); 
          image(sprite[type],posX - smallWidth*2,colY); 
          break;
          
      
      }
    
      
    }else{
      
      colX = posX;
      colY = height - 10 - obsHeight;
      rect(colX,colY,obsWidth,obsHeight); 
      image(sprite[type],colX,colY);     
    }
      
 

}

void move(){
  posX -=speed;
}




}
