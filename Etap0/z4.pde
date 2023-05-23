void setup(){
  fullScreen();
  background = loadImage("tlo.jpg");
}
PImage background;

void drawCircle(int steps)
{
  beginShape();
  for (int i = 0; i < steps; ++i)
    vertex(cos(TWO_PI * (float)i / float(steps)), sin(TWO_PI * (float)i / float(steps)));
  endShape();
}
float speed = 0f;
float maxSpeed = 5;
float acceleration = 0.0001f;
float speed2 = 0f;

void draw()
{
  background(0);
  image(background,0,0);
  translate(width *.5f, height *.5f);
  speed += 0.01f;
  speed2 += acceleration;

  pushMatrix();
  scale(70);
  fill(#FFF75A);
  noStroke();
  drawCircle(100);
  popMatrix();
  
  
 
  pushMatrix();
  rotate(speed*2f);
    translate(100, 100);
    fill(#C11B87);
    scale(20);
    drawCircle(100);
     pushMatrix();
        rotate(speed * 1.3f);
        translate(1.5, 0);
        fill(#8EDB47);
        scale(0.2);
        drawCircle(50);
      popMatrix();
      pushMatrix();
        rotate(speed * 3.56f);
        translate(2.15, 0);
        fill(#828BDE);
        scale(0.3);
        drawCircle(50);
      popMatrix();
      pushMatrix();
        rotate(speed * 2.56f);
        translate(2.8, 0);
        fill(#C47AF2);
        scale(0.25);
        drawCircle(50);
      popMatrix();
    pushMatrix();
  rotate(speed*3f);
    translate(180, 180);
    fill(#731BC1);
    scale(100);
    drawCircle(100);
  popMatrix();
  popMatrix();
  
   pushMatrix();
  rotate(speed*3f);
    translate(180, 180);
    fill(#731BC1);
    scale(40);
    drawCircle(100);
  popMatrix();
  
   pushMatrix();
  rotate(speed*1.5f);
    translate(250, 250);
    fill(#7F99E0);
    scale(30);
    drawCircle(100);
    pushMatrix();
    noFill();
    stroke(#EADFA8);
    strokeWeight(0.09);
    scale(1.5);
    drawCircle(100);
    noStroke();
    translate(-1.55, 0);
  popMatrix();
     pushMatrix();
        rotate(speed * 2.56f);
        translate(1.55, 0);
        fill(#EDDB39);
        scale(0.25);
        drawCircle(50);
      popMatrix();
  popMatrix();
  
 

  if (speed2 < maxSpeed) {
    acceleration += 0.001f;
  }
   pushMatrix();
  rotate(speed2);
    translate(340, 340);
    fill(#47CE8B);
    scale(50);
    drawCircle(100);
  popMatrix();
  
   pushMatrix();
  rotate(speed*1.4f);
    translate(450, 450);
    fill(#C15917);
    scale(35);
    drawCircle(100);
     pushMatrix();
        rotate(speed * 4.56f);
        translate(1.33, 0);
        fill(#CE9232);
        scale(0.14);
        drawCircle(50);
      popMatrix();
      pushMatrix();
        rotate(speed * 2.56f);
        translate(1.73, 0);
        fill(#8751D3);
        scale(0.12);
        drawCircle(50);
      popMatrix();
      pushMatrix();
        rotate(speed * 1.56f);
        translate(2.4, 0);
        fill(#34B0E8);
        scale(0.23);
        drawCircle(50);
      popMatrix();
  popMatrix();
  
   
  
}
