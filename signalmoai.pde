import ddf.minim.*;


Minim minim;
AudioSnippet aa, oo;
PImage backg, left, right;

//二進数でモールス信号の長音単音を分ける
int[][] name = {{1,0,1,1},{0,0,1,-1},{1,0,1,-1},{0,0,-1,-1}};//{0,0,2,2},{0,1,1,2},{0,1,2,2},{0,0,0,2},{0,1,2,2},{1,0,1,2},{0,0,2,2}
int i=0,j=0;

void setup(){
  size(614, 492);
  background(255);
  frameRate(3);
  backg=loadImage("moai.jpg");
  left=loadImage("moai_left.jpg");
  right=loadImage("moai_right.jpg");
  minim = new Minim(this);
  aa = minim.loadSnippet("men_aa.wav");
  oo = minim.loadSnippet("men_oo.wav");
}

void draw(){
  image(backg,0,0,614,492);
  
  text("Copyright © 1993-2016 Yuki Iwasaki. All rights reserved.", 270, 470);
  
}

void mouseClicked(){
  if(mouseX > 80 && mouseX < 180 && mouseY > 185 && mouseY < 400){
    image(left,0,0,614,492);

    aa.play();
    aa.rewind();
   }
   else if (mouseX > 350 && mouseX < 530 && mouseY > 50 && mouseY < 350){
     image(right,0,0,614,492);
     
    oo.play();
    oo.rewind();
  }
  else if (mouseX > 415 && mouseX < 500 && mouseY > 465 && mouseY < 475){
    codeMorse();
  }
  
}

void codeMorse(){
  for(i=0;i<4;++i){
    for(j=0;j<4;++j){
      if(name[i][j] < 0){
        break;
      }else if(name[i][j] == 1){
        //このブロックが終わるまで画像を表示したい
       image(left,0,0,614,492);
  
        aa.play();
        aa.rewind();
        delay(700);
        
      }else if(name[i][j] == 0){
        image(right,0,0,614,492);
        
        oo.play();
        oo.rewind();
        delay(200);
      }
    }
    delay(300);
  }        
}

void stop(){
  aa.close();
  oo.close();
  minim.stop();
  
  //super.stop();
}