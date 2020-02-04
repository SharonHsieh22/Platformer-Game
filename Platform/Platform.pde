import fisica.*;

color black = #000000;
color cyan   = #5CF3F7;
color blue   = #552DFA;
color pink   = #FC73FB;
color purple = #C60DFF;
color green  = #29FFAF;
color red    = color(224, 80, 61);
color orange = #FF920D;
color yellow = #FFFF50;

PImage map;
PImage levi, francis;
int x = 0;
int y = 0;
int gridsize = 32;
float vx, vy, zoomfactor, angle;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FBomb bomb = null;

ArrayList<FBox> boxes = new ArrayList<FBox>();

FBox player1, player2;
FWorld world;

void setup() {
  fullScreen(FX2D);
  Fisica.init(this);
  world = new FWorld(-10000, -10000, 10000, 10000);
  map = loadImage("map.png");
  levi = loadImage("Levi.png");
  francis = loadImage("francis.png");
  //load world
  while (y < map.height) {
    color c = map.get(x, y);
    
    if(c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize, y*gridsize);
      b.setStatic(true);
      //b.setName("");
      world.add(b);
    }
    
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
  
  player1();
}

void draw() {
  background(255);
  
  pushMatrix();
  translate(-player1.getX() + width/2, -player1.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();
  
  //left, right movement
  vx = 0;
  if(leftkey) vx = -500;
  if(rightkey) vx = 500;
  player1.setVelocity(vx, player1.getVelocityY());
  
  //jumping
  ArrayList<FContact> contacts = player1.getContacts();
  if(upkey && contacts.size() > 0) player1.setVelocity(player1.getVelocityX(), -500);
  //if(contacts.contains(""))
  
  //drop bombs
  if(spacekey && bomb == null) bomb = new FBomb();
  if(bomb!= null) bomb.act();
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey  = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (key == ' ') spacekey = false;
}
