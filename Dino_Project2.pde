Dino dino;
PImage [] sprites;
float spaceDownTime = 0;

void setup(){  
  size(800,400);
  loadSprites();
  dino = new Dino(sprites);
  
  
 
}

void draw(){
  background(255);
  spaceDownTime++;
 
 
  if(dino.isDead)
    dino = new Dino(sprites);
 
  //scale(1);
  stroke(0);
  //line(0,height - 20,width,height-20);
  stroke(255,0,0);
  fill(255);
  dino.show();
  dino.move();
}

void keyPressed(){
  switch(key){
    case ' ':
    case 'w':           
      if(dino.onAir == false ){        
        dino.velY = 10;      
        dino.spaceDown = true;
      }            
      break;
    case 's':
        dino.gravity = 2.5;
        dino.isDucking = true;
      break;
  }
  
}


void keyReleased(){
  switch(key){
    case ' ':
    case 'w':           
      dino.spaceDown = false;            
      break;
    case 's':      
      dino.isDucking = false;
      break;
  }
  
}





  void loadSprites(){
    
   int birdSize= 45,dinoSize = 45,roadWidth = 175,roadHeight  = 16;
    
   sprites = new PImage [15];
   
   sprites[0] = loadImage("sprite.png").get(229,3,17,35);  //small Cactus
   sprites[1] = loadImage("sprite.png").get(432,3,26,47);  //pair of cactuses
   sprites[2] = loadImage("sprite.png").get(333,3,24,47);  //big Cactus   
   
   sprites[3] = loadImage("sprite.png").get(764,0,dinoSize,dinoSize);  //right
   sprites[4] = loadImage("sprite.png").get(808,0,dinoSize,dinoSize);  //left
   sprites[5] = loadImage("sprite.png").get(675,0,dinoSize,dinoSize);  //jump
   sprites[6] = loadImage("sprite.png").get(939,17,dinoSize +10,33);  //duck left
   sprites[7] = loadImage("sprite.png").get(998,17,dinoSize +10,33);  //duck right
  
   sprites[8] = loadImage("sprite.png").get(133,0,birdSize,birdSize);  //bird up
   sprites[9] = loadImage("sprite.png").get(177,0,birdSize,birdSize);  //bird down
   
   sprites[10] = loadImage("sprite.png").get(2,53,roadWidth,roadHeight);  //1st chunk of road
   sprites[11] = loadImage("sprite.png").get(2+roadWidth,53,roadWidth,roadHeight);  //2nd chunk of road
   sprites[12] = loadImage("sprite.png").get(2+roadWidth*2,53,roadWidth,roadHeight);  //3rd chunk of road
   sprites[13] = loadImage("sprite.png").get(2+roadWidth*3,53,roadWidth,roadHeight);  //4th chunk of road
   sprites[14] = loadImage("sprite.png").get(2+roadWidth*4,53,roadWidth,roadHeight);  //5th chunk of road
   
 

  
  }
