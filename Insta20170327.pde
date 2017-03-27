CA ca;

void setup()
{
  size(1000, 1000);
  background(255);
  frameRate(60);
  colorMode(HSB);
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  ca = new CA(ruleset);
}

void draw()
{
  ca.render();
  ca.generate();
  
  if(ca.generation > 200)
  {
    background(255);
    ca.randomeze();
    ca.restart();
    ca.cell_color = color(random(255), 255, 255);
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  } 
  */
}