PImage enemyImg, fighterImg, bg1Img, bg2Img, hpImg , treasureImg, start1Img , start2Img,
       end1Img , end2Img ;

final int GAME_START=0,GAME_RUN=1,GAME_WIN=2,GAME_OVER=3 ;
int gameState ;

int enemyX, enemyY, treasureX , treasureY ,hpX ;
int a,b,c;

float x , y ,fighterSpeed =5;

boolean upPressed = false ;
boolean downPressed = false ;
boolean leftPressed = false ;
boolean rightPressed = false ;

void setup () {
  size(640,480) ;  
  fighterImg=loadImage("img/fighter.png");
  enemyImg=loadImage("img/enemy.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  treasureX=floor(random(30,500));
  treasureY=floor(random(50,400));
  hpX=40;
  enemyX=0;
  enemyY=floor(random(30,400));
  a=0;
  b=0;
  c=0;
  x=550;
  y=height/2;
  gameState=GAME_START;
 

} 

void draw() {
  //gamestart
  switch(gameState){
    case GAME_START:
          image(start2Img,0,0);
                if( 210<mouseX && mouseX<450 && 370<mouseY&& mouseY<400 ){
                   if(mousePressed){
                   gameState=GAME_RUN;
                     x=550;
                     y=height/2;
                     hpX=40;
                    enemyX=0;
                    enemyY=floor(random(30,400));
                   }else{
                   image(start1Img,0,0);
                   }
                  }
          
           
    break;
    
    case GAME_RUN:
               //bg
              background(0);
              image(bg1Img,a,0);
              a++;
              a%=1280;
              image(bg2Img,b-640,0);
              b++;
              b%=1280;
              image(bg1Img,c-1280,0); 
              c++;
              c%=1280;
              
              //fighter
              
              image(fighterImg,x,y);
               if(upPressed){
               y-=fighterSpeed;
               }
               if(downPressed){
               y+=fighterSpeed;
               }
               if(leftPressed){
               x-=fighterSpeed;
               }
               if(rightPressed){
               x+=fighterSpeed;
               }
               
               //boundary detection
               if(x<35){
                 x=35;
               }if(x>570){
                 x=570;
               }if(y<35){
                 y=35;
               }if(y>420){
                 y=420;
               }
              
              //hp
              
              fill(255,0,0);
              rect(15,15,hpX,20);
              image(hpImg,10,10);
              if(hpX>=200){
                hpX=200;
              }
              
              //treasure
              
              image(treasureImg,treasureX,treasureY);
              
              if(x>=treasureX&& x-treasureX<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                    if(hpX>=200){
                   hpX=200;
                }
                }
                 if(x>=treasureX&& x-treasureX<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-X<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-x<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
              
              //enemy
              
              image(enemyImg,enemyX,enemyY);       
              enemyX+=2;
              enemyX%=640;
              if(enemyY<y){
               enemyY++;     
              }
              if(enemyY>y){
               enemyY--;     
              }
              
              //life
              if(x>=enemyX && x-enemyX<=45 && y>=enemyY && y-enemyY<=45){
               hpX=hpX-40;
               enemyX=0;
               enemyY=floor(random(30,400));
              }
              if(x>=enemyX && x-enemyX<=45 && y<=enemyY && enemyY-y<=45){
                hpX=hpX-40;
                   enemyX=0;
                enemyY=floor(random(30,400));
              }
               if(enemyX>=x && enemyX-x<=45 && y>=enemyY && y-enemyY<=45){
                 hpX=hpX-40;
                 enemyX=0;
                 enemyY=floor(random(30,400));
              }
               if(enemyX>=x && enemyX-x<=45 && y<=enemyY && enemyY-y<=45){
                 hpX=hpX-40;
                 enemyX=0;
               enemyY=floor(random(30,400));
              }
               
            //gameOver
            
            if( hpX==0){         
             gameState=GAME_OVER;
            }
            
    break;
    case GAME_OVER:
       image(end2Img,0,0);
       if (210<mouseX &&mouseX<450 && 288<mouseY && mouseY<336  ){
           if(mousePressed){
           gameState = GAME_START;
           }else{
           image(end1Img,0,0);
           }          
     break;
      
      }
   
  }
}

void keyPressed(){
  
     if(key==CODED){
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
  
     if(key==CODED){
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
