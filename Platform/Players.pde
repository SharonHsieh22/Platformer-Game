void player1() {
  player1 = new FBox(gridsize, gridsize);
  player1.setPosition(width/4, height-250);

  //set visuals
  player1.attachImage(francis);
  //player1.setNoStroke();
  //colorMode(HSB);
  //player1.setFillColor(color(random(0, 255), 120, 240));
  //colorMode(RGB);

  //set physical properties
  player1.setStatic(false);
  player1.setDensity(1);
  player1.setFriction(0);
  player1.setRestitution(0);
  player1.setRotatable(false);
  

  //add to world
  world.add(player1);
}
