//Thomas Delaney C15300756 DT228/2
void setup ()
{
  size(800, 800);
  loadData();
}

ArrayList <Star> stars = new ArrayList <Star>();

void draw()
{
  
}

void loadData()
{
  Table StarTable = loadTable("HabHYG15ly.csv", "header");
  
  for (TableRow row : StarTable.rows()) 
  {
    Star e = new Star(row);
    stars.add(e);
  }
}