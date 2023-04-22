int cols, rows;
int scl = 20;
int w = 3200;
int h = 1600;
float [][] terrain;

float xoff, yoff;

float flying = 0;

float playerXposition = 0;
float playerYposition = 0;

float accY = 0;
float accX = 0;

boolean keyUp;
boolean keyDown;
boolean keyRight;
boolean keyLeft;

float c = .001;
float d = 1.02;
float l = .00001;

float angle = .1;
float flyHeight = 0; 

void setup() {

  size(1400,700,P3D);
  
  cols = w/scl;
  rows = h/scl;
  
  terrain = new float [cols][rows];
  

}

void draw() {
  
  if (keyUp){
    accY -= c;
  }
   if (keyDown){
    accY += c;
  }
   if (keyRight){
    accX += c;
  }
   if (keyLeft){
    accX -= c;
  }
  
   playerYposition += accY;
   playerXposition += accX;
  
   accY = accY > l || accY < -l ? accY/d : 0;
   accX = accX > l || accX < -l? accX/d : 0;
   
   println(accY, accX);
   
  
  yoff = playerYposition;
  for(int y = 0; y< rows; y++) {
    xoff = playerXposition;
    for(int x = 0; x< cols; x++) {
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -150, 150);
      xoff += .04;
    }
    yoff += .04;
  }
 
  background(25);
  stroke(215);
  noFill();
  
  translate(width/2, height/2);
  rotateX(angle);
  translate(-w/2,-h/2, flyHeight);
  
  for(int y = 0; y< rows-1; y++) {
  beginShape(TRIANGLE_STRIP);
    for(int x = 0; x< cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y+1) * scl, terrain[x][y+1]);
    }
    endShape();
  }
}


void keyPressed(){

 
   if (key == 'w'){
     keyUp = true;
   }  
   
   if (key == 's'){
     keyDown = true;
   }  
   
   if (key == 'd'){
   keyRight = true;
   }  
     
   if (key == 'a'){
   keyLeft = true;
   }
   
   if(key == 'q')  {flyHeight+=10;}
   if(key == 'e')  {flyHeight-=10;}
   
   if(keyCode == UP)  {angle+=.1;}
   if(keyCode == DOWN){angle-=.1;}
  }


void keyReleased(){
 
   if (key == 'w'){
     keyUp = false;
   } else 
   
   if (key == 's'){
     keyDown = false;
   } else 
   
     if (key == 'd'){
     keyRight = false;
     
     } else 
     
     if (key == 'a'){
     keyLeft = false;

     }
  }
