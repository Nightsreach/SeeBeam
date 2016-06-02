public class Node
{
  public float x;
  public float y;
  
  public Node(float xPos, float yPos)
  {
    this.x = xPos;
    this.y = yPos;
  }
  
  public String ToString()
  {
    return "X: " + Float.toString(this.x) + ", Y: " + Float.toString(this.y);
  }
  
}