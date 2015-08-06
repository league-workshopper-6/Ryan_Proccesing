import ddf.minim.*;
Minim minim;   
AudioSample sound;  
PImage backgroundImage;
int xpos=200;
int ypos=10;
int speedx=10;
int speedy=10;
int screeny=750;
int screenx=1250;
int paddlength=150;
int paddley=700;
void setup(){
size(screenx,screeny);
minim = new Minim (this);   
 sound = minim.loadSample("pong.wav", 128);
backgroundImage = loadImage("images.jpeg");




}
void draw(){
xpos=xpos+speedx;
ypos=ypos+speedy;
image(backgroundImage, 0, 0);
image(backgroundImage, 0, 0, screenx, screeny);
fill(255,255,255);
ellipse(xpos,ypos,20,20);
stroke(0,0,0,0);

if(ypos<=0 || ypos>=screeny){
  speedy=-speedy;
  
}



if(xpos<=0 || xpos>=screenx){
speedx=-speedx;
}
 
if(ypos==screeny||ypos==0||xpos==0||xpos==screenx){
  sound.trigger();}
 
rect(mouseX, paddley, paddlength, 20);

if(intersects(xpos, ypos, mouseX, paddley, paddlength)){
speedy=-speedy;
sound.trigger();
}

}

boolean intersects(int xpos, int ypos, int paddlex, int paddley, int paddlength) {
if (ypos > paddley && xpos > paddlex && xpos < paddlex + paddlength)
return true;
else 
return false;
}

