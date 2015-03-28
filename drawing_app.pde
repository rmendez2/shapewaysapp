

//Initialize colour variables
int colours[][]=new int[3][3]; 
int position[][]=new int[4][2];
int a;
int b;
int c;
int radii=20;
//Initialize pencil variable
int d=1;
PImage band1;
PImage band2;
PImage band3;
PImage band4;

//save button
float x = 20;
float y = 5;
float w = 120;
float h = 30;

final static String SAVE = "SAVE";

void setup() {
  band1 = loadImage("ring-pattern-branch.png");
  band2 = loadImage("ring-pattern-mustache.jpeg");
  band3 = loadImage("ring-pattern-star.png");
  band4 = loadImage("ring-pattern-striped-gradient.png");

  size(800, 480);
  colorMode(RGB);
  smooth();
  background(200);
  frameRate(60);

  //Draw instructions
  for (int i=0;i<4;i++) {
    if (i%2==0) {
      position[i][0]=50;
    }
    else {
      position[i][0]=110;
    }
  }
  position[0][1]=160;
  position[1][1]=160;
  position[2][1]=210;
  position[3][1]=210;
  //  position[4][1]=260;
  //  position[5][1]=260;
  //  position[6][1]=310;
  //  position[7][1]=310;
  //  position[8][1]=360;
  //  position[9][1]=360;
  //Add colour values in array
  //Black
  colours[0][0]=0;
  colours[0][1]=0;
  colours[0][2]=0;
  //Grey
  colours[1][0]=130;
  colours[1][1]=130;
  colours[1][2]=130;
  //White
  colours[2][0]=255;
  colours[2][1]=255;
  colours[2][2]=255;
  //Red
  //  colours[3][0]=255;
  //  colours[3][1]=0;
  //  colours[3][2]=0;
  //  //Orange
  //  colours[4][0]=255;
  //  colours[4][1]=165;
  //  colours[4][2]=0;
  //  //Yellow
  //  colours[5][0]=255;
  //  colours[5][1]=255;
  //  colours[5][2]=0;
  //  //Green
  //  colours[6][0]=0;
  //  colours[6][1]=255;
  //  colours[6][2]=0;
  //  //Blue
  //  colours[7][0]=0;
  //  colours[7][1]=0;
  //  colours[7][2]=255;
  //  //Indigo
  //  colours[8][0]=75;
  //  colours[8][1]=0;
  //  colours[8][2]=130;
  //  //Violet
  //  colours[9][0]=238;
  //  colours[9][1]=130;
  //  colours[9][2]=238;
}

void draw() {


  //Call methods
  toolbox();
  buttonListener();
  colourPicker();
  thickness();
  


  if (mousePressed && (mouseButton == LEFT)) line(pmouseX, pmouseY, mouseX, mouseY);

  //Eraser
  if (mousePressed && (mouseButton == RIGHT)) {
    fill(200);
    stroke(200);
    strokeWeight(7);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }


  //Draw current line thickness
  fill(0);
  stroke(0);
  line(25, 436, 135, 436);
  //Reset line thickness for drawing borders etc
  strokeWeight(3);
  //Clear background
  if (keyPressed && key ==' ')clearBG();
}

//Reset Canvas method
void clearBG() {
  //Repaint background
  fill(200);
  stroke(0);
  rect(0, 0, 799, 479);
  //Reset colour chosen
  stroke(a, b, c);
  fill(a, b, c);
}

//Adjust pencil thickness method
void thickness() {
  if (keyPressed && key =='1') d=1; 
  if (keyPressed && key =='2') d=3;
  if (keyPressed && key =='3') d=5;
  if (keyPressed && key =='4') d=7;
  if (keyPressed && key =='5') d=9;
  if (keyPressed && key == '6') d=11;
  strokeWeight(d);
}

//Draw toolbox method
void toolbox() {

  //Panels
  fill(60);
  stroke(0);
  rect(0, 0, 160, 479);
  rect(160, 390, 700, 100);
  rect(650, 0, 150, 390);

  //Lines/Borders

  fill(255);
  rect(20, 5, 120, 30);
  fill(0);
  textSize(25);
  text("SAVE", 52, 30);
  fill(0);
  //rect(9, 69, 142, 32);
  line(0, 43, 160, 43);
  //line(0, 110, 160, 110);
  line(0, 390, 160, 390);
  fill(255);
  rect(9, 420, 142, 32);
  fill(255);
  rect(200, 410, 75, 40);
  textSize(15);
  fill(0);
  text("Branch", 215, 420, 75, 40);
  fill(255);
  rect(300, 410, 75, 40);
  textSize(15);
  fill(0);
  text("Mustache", 305, 420, 75, 40);
  fill(255);
  rect(400, 410, 75, 40);
  textSize(15);
  fill(0);
  text("Stars", 420, 420, 75, 40);
  fill(255);
  rect(500, 410, 75, 40);
  textSize(15);
  fill(0);
  text("Zebra", 515, 420, 75, 40);

  //labels
  fill(255);
  text("Draw Color", 35, 47, 150, 40);
  fill(#FA086D);
  text("Draw Color", 34, 46, 150, 40);
  fill(255);
  text("Line Diameter", 30, 395, 150, 40);
  fill(#FA086D);
  text("Line Diameter", 29, 394, 150, 40);
  fill(255);
  text("1 - 6", 60, 455, 150, 40);
  fill(#FA086D);
  text("1 - 6", 59, 454, 150, 40);
  line(165, 170, 640, 170);
  line(165, 230, 640, 230);
  smooth();
  fill(255);
  text("band border", 165, 145, 150, 40);
  fill(#FA086D);
  text("band border", 164, 144, 150, 40);
  fill(255);
  textSize(16);
  text("Clear : Spacebar", 600, 400, 150, 40);
  text("Draw : Left Mouse", 600, 415, 150, 40);
  text("Erase : Right Mouse", 600, 430, 160, 40);
  text("about ShapeWays", 655, 100, 200, 40);





  //Colour palette
  for (int i=0;i<3;i++) {
    fill(colours[i][0], colours[i][1], colours[i][2]);
    ellipse(position[i][0], position[i][1], 40, 40);
  }
  //Reset fill colour
  fill(a, b, c);
  //Current colour box
  stroke(0);
  rect(10, 70, 140, 30);
  //Reset stroke colour
  stroke(a, b, c);
}

//Colour palete detection and selector method
void colourPicker() {
  for (int i=0;i<3;i++) {
    if ((dist(position[i][0], position[i][1], mouseX, mouseY)<radii)) {
      fill(colours[i][0], colours[i][1], colours[i][2]);
      stroke(0);
      ellipse(position[i][0], position[i][1], 50, 50);
      if (mousePressed && (mouseButton == LEFT)) {
        a=colours[i][0];
        b=colours[i][1];
        c=colours[i][2];
      }
    }
  }
}

void saveIncremental(String prefix, String extension) {
  int savecnt=0;
  boolean ok=false;
  String filename="";
  File f;

  while (!ok) {
    // Get a correctly configured filename
    filename=prefix;  
    if (savecnt<10) filename+="00";
    else if (savecnt<100) filename+="0";
    filename+=""+savecnt+"."+extension;

    // Check to see if file exists, using the undocumented
    // savePath() to find sketch folder
    f=new File(savePath(filename));
    if (!f.exists()) ok=true; // File doesn't exist
    savecnt++;
  }

  println("Saving "+filename);
  PImage cp = get (165, 175, 475, 50);
  cp.save(filename);
}

void mousePressed() {


  if (mouseX < 275 && mouseX > 200 && mouseY < 450 && mouseY > 410) {
    band1.resize(475, 50);
    image(band1, 165, 175);
  }
  if (mouseX < 375 && mouseX > 300 && mouseY < 450 && mouseY > 410) {
    band2.resize(475, 50);
    image(band2, 165, 175);
  }
  if (mouseX < 475 && mouseX > 400 && mouseY < 450 && mouseY > 410) {
    band3.resize(475, 50);
    image(band3, 165, 175);
  }
  if (mouseX < 575 && mouseX > 500 && mouseY < 450 && mouseY > 410) {
    band4.resize(475, 50);
    image(band4, 165, 175);
  }
  if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
    saveIncremental("design/test", "png"); 
    println("The image has been saved.");
  }
  if (mouseX>655&& mouseX <800 && mouseY>100 && mouseY <115){
    link("https://www.shapeways.com/creator/custom-ring?li=nav#landing", "_new"); 
  }
}

void buttonListener(){
    if (mouseX < 275 && mouseX > 200 && mouseY < 450 && mouseY > 410) {
    cursor(HAND);
  }
  if (mouseX < 375 && mouseX > 300 && mouseY < 450 && mouseY > 410) {
    cursor(HAND);
  }
  if (mouseX < 475 && mouseX > 400 && mouseY < 450 && mouseY > 410) {
    cursor(HAND);
  }
  if (mouseX < 575 && mouseX > 500 && mouseY < 450 && mouseY > 410) {
    cursor(HAND);
  }
  if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
   cursor(HAND);
  }
  if (mouseX>655&& mouseX <800 && mouseY>100 && mouseY <115){
   cursor(HAND);
  }
  else{
  cursor(ARROW);
  }
}

