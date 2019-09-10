class Dino{
  //GLOBALS
  
  ArrayList<Obstacle> obstacles; 
  ArrayList<Bird> birds;
  
  float posY = 0;
  float posX = 50;
  float gravity = 1;
  float velY = 0;
  float universalSpeed = 4;
  float score = 0;
  
  
  //Collision box
  float colX = 50;
  float colY;
  float colW = 45;
  float colH = 45;
  
  Road road;
  
  boolean maxHeight = false;
  boolean onAir = false;
  boolean isDead = false;
  boolean isJumping = false;
  boolean isDucking = false;
  boolean timeForBird = false;
  boolean spaceDown = false;
  PImage sprites [];  
  int size = 45; //size of Dinosaur collision box  
  
  Dino(PImage [] sprites){  
    this.sprites = sprites;
    
    obstacles = new ArrayList();  
    birds = new ArrayList();
    
    road = new Road(universalSpeed,sprites);
    
    //add the first
  
    addObstacle();
    
    
  }
  
  


//Animation Variables  
int animationTimer = 0; 
int a = 0; //index of sprite 

void show(){
  
  road.show();
  score += 0.1;
  
  if(score >= 50){
    timeForBird = true;
  }else{
    timeForBird = false;
  }
  
  fill(0);     
  text("SCORE : " + int(score),width - 100,20);
  fill(255,0,0);
  text("FPS : " +  int(frameRate),0,20);
  
  
  fill(255);  
  
  animationTimer++;
  
 if(animationTimer <= 7){  //Every 7 frames changes sprite
   a = 4;
 }else if(animationTimer >7 && animationTimer <=14){
   a = 3; 
 }else
     animationTimer = 0;
     
 if(isDucking && animationTimer <= 7 && onAir == false)
   a = 6;
 else if(isDucking && animationTimer >7 && animationTimer <=14 && onAir == false)  
   a = 7;
   
 if(isJumping)
   a = 5;
 
  //Draw Dino 
  if(a == 6 || a == 7 && isDucking){  //Change hitbox if he is ducking
     colY = height - 10 - (posY + size/2 +5);
     colW = size + 10;
     colH = size/2 +5;  
  }else{
    colY = height - 10 - (posY + size);
    colW = size;
    colH = size;
    
  }
  
  
  rect(colX,colY,colW,colH);
  image(sprites[a],colX,colY); 
  
  for(Obstacle o:obstacles){
    o.move();
    o.show();                      
  } 
  
  for(Bird b:birds){
    b.move();
    b.show();                      
  }
  
  road.move();
     
  

}


void addObstacle(){  
  obstacles.add(new Obstacle(floor(random(3)),universalSpeed,sprites));  //Obstacle(int margin,int type,float speed){
}


void addBird(){  
  birds.add(new Bird(floor(random(2)),universalSpeed,sprites));  
}

float lineTimer = 0;
float obstacleTimer = 0;
float speedTimer = 0;

  void move(){
    
    for(Obstacle ob:obstacles){           
       if(isDead)
         break;         
       isDead = checkCol(ob);
          
    }
    
    
    for(Bird b:birds){        
       if(isDead)
         break;         
       isDead = checkColWithBird(b);
    }
    
    //Scaling Speed  
    speedTimer++;
    
    if(speedTimer >= 100){
      universalSpeed += 0.1;
      speedTimer = 0;   
      
    }
    
    road.speed = universalSpeed;

    for(int i =0; i< birds.size(); i++){    
      birds.get(i).speed = universalSpeed;
      if(birds.get(i).posX <=- birds.get(i).size){
          birds.remove(i);       
          
      }
        
    }
    
    
    //Add Obstacles
    obstacleTimer++;
    
    if(obstacleTimer >= floor(random(50,90))){  //Randomness in obstacles space
      
      if(timeForBird && floor(random(6)) == 0) //1 out 7 its a bird
        addBird();
      else
        addObstacle();  
      
      obstacleTimer = 0;
       
    }
    
    for(int i =0; i< obstacles.size(); i++){
      obstacles.get(i).speed = universalSpeed;
      if(obstacles.get(i).posX <= -size){
          obstacles.remove(i);       
          
      }
        
    }
    
    
    
    
    posY += velY;  
    
     if(spaceDown && maxHeight == false){
        if(posY < 80)
            velY++;
        else
          maxHeight = true;
     }  
    
    
    if(posY > 0){     
      velY -= gravity;
      onAir = true;
          
      
    }else {
      maxHeight = false;
      onAir = false;
      velY = 0;
      posY = 0;
      gravity = 1;
    }
    
  }


  boolean checkCol(Obstacle ob){
    
    if(((ob.colX <= colX + colW && colX <= (ob.colX + ob.size)) || (colX + colW) >= ob.colX && ob.colX >= colX) && colY+colH >= ob.colY){ //Collide left side of the dino ||  collide right side of the dino   
        return true;  //Maybe a little more fixing    
    }
    
    return false;

  }


  boolean checkColWithBird(Bird b){  
    
    if((((colX >= b.colX && colX < b.colX + b.size) || (colX + colW >= b.colX &&  colX + colW < b.colX + b.size)) && (colY + colH <= b.colY + b.size && colY + colH >= b.colY || (colY <= b.colY + b.size && colY >= b.colY )))){
      return true;
    } 
      
       
    return false;

  }

}
