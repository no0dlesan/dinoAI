class Bird{
  float posX = width; //change to int for mind blown bug
  PImage [] sprites;
  int size = 45;
  int birdHeight;
  float speed;  
  float colX;
  float colY;
  
  int animationTimer = 0;
  int a = 0;
  
  
  Bird(int position,float speed,PImage [] sprites){
    this.speed = speed;
    this.sprites = sprites;
    
    
    switch(position){
      case  0:
        birdHeight = 100;        
      break;
      case  1:
        birdHeight = 50;        
      break;
    }
    
    
    
   
  
  }
  
  void show(){ 
    
    colY = height - birdHeight;
    colX = posX;
    animationTimer++;  
    
    stroke(255,0,0);
    rect(colX,colY,size,size);
    
    if(animationTimer <= 10){  //Every 10 frames changes sprite
       a = 8;
    }else if(animationTimer >10 && animationTimer <=20){
       a = 9; 
    }else
       animationTimer = 0;     
     
    image(sprites[a],colX,colY,size,size); 
  
  
  }
  
  
  void move(){
      posX -= speed;
      
  
  }
  
  
  


}
