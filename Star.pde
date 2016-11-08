class Star
{
  int Hab;
  String DisplayName;
  float Distance;
  float Xg;
  float Yg;
  float Zg;
  float AbsMag;
  
  //uses headers to get specified values
  Star(TableRow row)
  {
    this.Hab = row.getInt("Hab?");
    this.DisplayName = row.getString("Display Name");
    this.Distance = row.getFloat("Distance");
    this.Xg = row.getFloat("Xg");
    this.Yg = row.getFloat("Yg");
    this.Zg = row.getFloat("Zg");
    this.AbsMag = row.getFloat("AbsMag"); 
  }
  
  //convers object to a string so it can be printed
  String toString()
  {
    return Hab + "\t" + DisplayName + "\t" + Distance + "\t" + Xg + "\t" + Yg + "\t" + Zg + "\t" + AbsMag;
  }
}