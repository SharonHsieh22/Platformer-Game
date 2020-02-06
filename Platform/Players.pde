void player1() {
  player1 = new FBox(gridsize, gridsize);
  player1.setPosition(width/6, height-250);

  //set visuals
  //player1.attachImage(currentAction[costumeNum]);
  // if(frameCount % 10 == 0) {
  //  costumeNum++;
  //  if(costumeNum >= currentAction.length) costumeNum = 0;
  //  println(costumeNum);
  // }

  //set physical properties
  player1.setStatic(false);
  player1.setDensity(1);
  player1.setFriction(0);
  player1.setRestitution(0);
  player1.setRotatable(false);
  

  //add to world
  world.add(player1);
}
