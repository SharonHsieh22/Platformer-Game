import fisica.*;

color black = #000000;

PImage map;
int x = 0;
int y = 0;
int gridsize = 20;
float vx, vy, zoomfactor, angle;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;

ArrayList<FBox> boxes = new ArrayList<FBox>();

FBox player1, player2;
FWorld world;

void setup() {
  size(800, 600);
  Fisica.init(this);
  world = new FWorld();
  map = loadImage("map.png");
  //load world
  while (y < map.height) {
    color c = map.get(x, y);
    
    if(c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize, y*gridsize);
      b.setStatic(true);
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
  world.step();
  world.draw();
  
  //left, right movement
  vx = 0;
  if(leftkey) vx = -500;
  if(rightkey) vx = 500;
  player1.setVelocity(vx, player1.getVelocityY());
  
  //jumping
  ArrayList<FContact> contacts = player1.getContacts();
  if(upkey && contacts.size() > 0) player1.setVelocity(player1.getVelocityX(), -500);
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
