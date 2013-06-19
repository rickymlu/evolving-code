//GLOBAL VARIABLES
color color1 = color(255, 0, 0); //changed from 'red'
color color2 = color(0, 0, 255); //changed from 'blue'
int maxSize = 40;
int minSize = 10;
int maxAlpha = 100; //decreased from 255
int minAlpha = 0; //decreased from 90
int counter = 0;
int counter_limit = 150;

float x, y;
float dim = 80.0;

float spin = 0.0;

//sets up the sketch
void setup(){
 size(600,600, P3D);
 smooth();
 background(189,252,235);
 
 //turns off outline
 noStroke();
}

//does the action
void draw(){
  
  color drawColor = lerpColor(color1, color2, random(0,1));
  float drawAlpha = random(minAlpha, maxAlpha);
  float diameter = random(minSize, maxSize);
  

    strokeWeight(.75);
    triangle(300, 225, 213, 375, 386, 375);


  
  spin += 0.01;
  x += 1.5;
  if (x > width + dim) { x = -dim;} 
  fill(255);
  lights();
  pushMatrix();
  translate(x, height/2, 0);
  rotateX(PI/9 + spin);
  rotateY(PI/5 + spin);
  rotateZ(PI/3 + spin);
  box(150);
  popMatrix();
  
  //set the fill color and alpha
  fill(drawColor, drawAlpha);
  
  //draw the circle
  ellipse(random(width), random(height), diameter, diameter);
  //ellipse(random(width), random(height/3)+430, diameter, diameter);
  
  //checks to see if counter is up, randomizes new colors, otherwise adds to counter
  if (counter == counter_limit) {
    color1 = color(random(0, 255), random(0, 255), random(0, 255));
    // fixed this line since both where assiging to color1 kpow
    color2 = color(random(0, 255), random(0, 255), random(0, 255));
  } else { counter++; }

  //Draw ellipse at size and location of mouse xy and increase framerate. Press 'Enter' to start and 'Spacebar' to stop.
  if (key == ENTER) {
    //i'm dissing the mega elipse and i adjusted the framerate - kpow
    //ellipse(mouseX, mouseY, mouseX, mouseY);
    frameRate(200);
  } else {
    frameRate(20);
  }
  
}
//pause sketch by holding down anykey
void keyPressed(){
  noLoop();
}
void keyReleased(){
  loop();
}

