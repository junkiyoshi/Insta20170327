class CA
{
  int[] cells;
  int[] ruleset;
  int w = 5;
  int generation = 0;
  color cell_color;
  
  CA(int[] r)
  {
    cells = new int[width / w];
    ruleset = r;
    restart();
    cell_color = color(0);
  }
  
  void restart()
  {
    for(int i = 0; i < cells.length; i++)
    {
      cells[i] = int(random(2));
    }
    cells[cells.length / 2] = 1;
    generation = 0;
  }
  
  void randomeze()
  {
     for (int i = 0; i < ruleset.length; i++) 
     {
      ruleset[i] = int(random(2));
    }
  }
  
  void generate()
  {
    int[] nextgen = new int[cells.length];
    for(int i = 1; i < cells.length - 1; i++)
    {
      int left = cells[i - 1];
      int me = cells[i];
      int right = cells[i + 1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation += 1;
  }
  
  void render()
  {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(cell_color);
      else               fill(255);
      //stroke(0);
      noStroke();
      rect(i*w, (generation % (height / w)) * w, w, w);
      //rect(i*w, generation * w, w, w);
    }
  }
  
  int rules(int a, int b, int c)
  {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
}