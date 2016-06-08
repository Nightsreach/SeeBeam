public class CrossSection 
{
  private Node thisNode;
  private int beamLength;
  private ArrayList<Node> crossSectionNodes = new ArrayList<Node>(); 
  
  public void setLength(int Length)
  {
    beamLength = Length;
  }
  
  public int getLength()
  {
   return beamLength; 
  }
  
  public void addNode()
  {
    thisNode = new Node();
    crossSectionNodes.add(thisNode);
  }
  
  public Node getNodeAtIndex(int index)
  {
    return crossSectionNodes.get(index); 
  }
  
  public String getNodes()
  {
    String nodeList = "";
    for (int i = 0; i < crossSectionNodes.size(); i++)
    {
     nodeList += crossSectionNodes.get(i).ToString() + "\n";
    }
    return nodeList;
  }
}