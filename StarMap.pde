//Thomas Delaney C15300756 DT228/2
void setup ()
{
  size(800, 800);
  background(0);
  loadData();
  printStars();
}

//global variables
ArrayList <Star> stars = new ArrayList <Star>();
boolean clickCheck = false;

void draw()
{
  background(0);
  drawGrid();
  drawStars();
  
  if (mousePressed == true)
  {
    selectStars();
  }
}

//add a new table row every row to a new element in stars
void loadData()
{
  Table StarTable = loadTable("HabHYG15ly.csv", "header");

  for (TableRow row : StarTable.rows()) 
  {
    Star e = new Star(row);
    stars.add(e);
  }
}

//print star info via the toString method in Star
void printStars()
{
  for (int i = 0; i < stars.size(); i++)
  {
    Star e = stars.get(i);
    println(e);
  }
}

void selectStars()
{
  if (clickCheck == false)
  {
    for (int i = 0; i < stars.size(); i++)
    {
      Star e = stars.get(i);
      
      float x = map (e.Xg, -5, 5, 50, width-50);
      float y = map (e.Yg, -5, 5, 50, height-50);
      
      //println(x+" "+y);
      
      if ((mouseX > x+e.AbsMag && mouseX < x-e.AbsMag) && (mouseY > y+e.AbsMag && mouseY < y+e.AbsMag))
      {
        clickCheck = true;
        println("found");
        break;
      }
     
      //println("mX is "+mouseX);
      //println("mY is "+mouseY);
    }
  }
}

//map x and y value and print star info
void drawStars()
{
  for (int i = 0; i < stars.size(); i++)
  {
    Star e = stars.get(i);
    
    float x = map (e.Xg, -5, 5, 50, width-50);
    float y = map (e.Yg, -5, 5, 50, height-50);
    
    stroke(255, 255, 0);
    line (x, y, x+3, y);
    line (x, y, x-3, y);
    line (x, y, x, y+3);
    line (x, y, x, y-3);
    
    noFill();
    stroke(255, 0, 0);
    ellipse(x, y, e.AbsMag, e.AbsMag);
    
    fill(255);
    textAlign(LEFT, CENTER);
    text(e.DisplayName, x+10, y-2);
  }
}


void drawGrid()
{
  float x = 50;
  float y = 50;
  float parsecs = -5;
  float space = 70;
  boolean fline = false;

  stroke(255, 0, 255);

  //loop through drawing a line every 70 pixels on the x axis
  while (y <= height-50)
  {
    while (x <= width-50)
    {
      if (x+space > width)
      {
        break;
      }    

      line(x, y, x+space, y);
    
      if (fline == false)
      {
        fill(255, 0, 255);
        text(parsecs, x-18, y-10);
        parsecs++;
      }
     
      x += space;
    }
    x = 50;
    y += space;
    fline = true;
  }
  
  //reset values
  fline = false;
  parsecs = -4;
  x = 50;
  y = 50;

  //loop through drawing a line every 70 pixels on the y axis
  while (x <= width-50)
  {
    while (y <= height-50)
    {
      if (y+space > height)
      {
        break;
      }    
    
      line (x, y, x, y+space);
      
      if (fline == false)
      {
        fill(255, 0, 255);
        text(parsecs, x-45, y+75);
        parsecs++;
      }
      
      y += space;
    }
    y = 50;
    x += space;
    
    fline = true;
  }
}