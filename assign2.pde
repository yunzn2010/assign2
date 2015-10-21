/* please implement your assign1 code in this file. */
PImage bg1img;
PImage bg2img;
PImage fighterimg;
PImage enemyimg;
PImage treasureimg;
PImage hpimg;
PImage start1img;
PImage start2img;
PImage end1img;
PImage end2img;
int x;
int y;
int a;
int z;
int e;
int f;
float g=(random(480));
int POINT;
float b=floor(random(640));
float c=floor(random(480));
float blood=(random(225));
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;
final int GAME_START=1,GAME_RUN=2,GAME_LOSE=3;
int gameState;


void setup () {
  size(640,480) ;  
  bg1img=loadImage("img/bg1.png");
  bg2img=loadImage("img/bg2.png");
  fighterimg=loadImage("img/fighter.png");
  enemyimg=loadImage("img/enemy.png");
  treasureimg=loadImage("img/treasure.png");
  hpimg=loadImage("img/hp.png");
  start1img=loadImage("img/start1.png");
  start2img=loadImage("img/start2.png");
  end1img=loadImage("img/end1.png");
  end2img=loadImage("img/end2.png");
  x=640;
  y=0;
  z=0;
  a=0;
  e=600;
  f=240;
  POINT=0;
  blood=45;
  background(0);
  gameState=GAME_START;
}

void draw() {
  // your code
  switch(gameState){
    case GAME_START: 
  image(start2img,0,0);
  if(mouseX>=220&& mouseX<=440&&mouseY>380&&mouseY<420){
   image(start1img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   }
  }//start
  break;
  case GAME_RUN:
  image(bg1img,-640+x,0);
  x+=4;
  x%=1280;//bg1  
  image(bg2img,y-640,0);
  y+=4;
  y%=1280;//bg2
  image(fighterimg,e,f);
  if(upPressed){
    f-=6;
  }//fighter
  if(downPressed){
    f+=6;
  }
  if(rightPressed){
    e+=6;
  }
  if(leftPressed){
    e-=6;
  }
  if(e>640){
    e=0;
  }
  if(e<0){
    e=640;
  }
  if(f>480){
    f=0;
  }
  if(f<0){
    f=480;
  }
  
  image(enemyimg,a,g);
  a+=4;
  if(a>=640){
    a=0;
    g=(random(480));
  }
  
  image(treasureimg,b,c);
  
  fill(255,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpimg,20,20);//hp
if(a+40>=e&&e+40>=a){
  if(g+40>=f&&f+40>=g){
    blood-=45;
    a=0;
    g=(random(480));
  }
}//blood
if(blood>=225){
  blood=225;
}
if(b+40>=e&&e+40>=b){
    if(c+40>=f&&f+40>=c){
    b=floor(random(20,620));
    c=floor(random(20,460));
    blood+=22.5;
    }
  }//treasure
  if(g>f){
    g-=2;
  }
  if(g<f){
    g+=2;
  }
  
 if(blood<=30){
   gameState=GAME_LOSE;
 }
 break;
 case GAME_LOSE:
   image(end2img,0,0);
   if(mouseX>220&&mouseX<440&&mouseY>300&&mouseY<340){     
     image(end1img,0,0);
     if(mousePressed){
       gameState=GAME_RUN;
       a=0;
       blood=45;
       e=600;
       f=240;
       g=(random(480));
           b=floor(random(20,620));
    c=floor(random(20,460));
     }//dot
   }//touch
 }//stop
  
}//void
void keyPressed(){
  if(key == CODED) {
    switch(keyCode){
    case UP:
      upPressed=true;
      break;
    case DOWN:
      downPressed=true;
       break;
    case LEFT:
     
      leftPressed=true;
      break;
    case RIGHT:
      rightPressed=true;
      break;
      }
    }
  }
  void keyReleased(){
    if(key == CODED) {
    switch(keyCode){
    case UP:
    upPressed=false;
    break;
    case DOWN:
    downPressed=false;
    break;
    
    case LEFT:
    leftPressed=false;
    break;
    case RIGHT:
    rightPressed=false;
    break;
      }
    }
  }
