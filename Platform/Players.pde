void player1() {
  player1 = new FBox(gridsize-8, gridsize);
  player1.setPosition(width/6, height-250);

  //set physical properties
  player1.setStatic(false);
  player1.setDensity(1);
  player1.setFriction(0);
  player1.setRestitution(0);
  player1.setRotatable(false);
  

  //add to world
  world.add(player1);
}
