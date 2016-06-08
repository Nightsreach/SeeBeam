public class Node
{
  public Group container;
  public Textfield xInput;
  public Textfield yInput;
  public int id;
  public Toggle joinCheck;
  
  public Node() {
    //id is the next biggest number
    if(Nodes.size() > 0)
      this.id = Nodes.get(Nodes.size()-1).id+1;
    else
      this.id = 1;
    
    this.container = cp5.addGroup("Node "+Nodes.size())
      .setGroup("Right Sidebar")
      .setPosition(0,5*xUnit + (Nodes.size()*3*yUnit))
      .setWidth(10*xUnit)
      .hideBar();
      
    cp5.addLabel("Header "+id)
      .setGroup(this.container)
      .setText("Node "+id+":")
      .setPosition(0,-20);
    
    cp5.addLabel("Join Label "+id)
      .setGroup(this.container)
      .setText("Join:")
      .setPosition(0,0)
      .setSize(xUnit,yUnit);
      
    this.joinCheck = cp5.addToggle("Join Field "+id)
      .setGroup(this.container)
      .setCaptionLabel("")
      .setPosition(xUnit,0)
      .setSize(yUnit,yUnit);
    
    cp5.addTextlabel("X Label "+id)
      .setGroup(this.container)
      .setText("X:")
      .setPosition(2*xUnit,0)
      .setSize(2*xUnit,2*yUnit);
    
    this.xInput = cp5.addTextfield("X Field "+id)
      .setGroup(this.container)
      .setText("0")
      .setCaptionLabel("")
      .setPosition(3*xUnit,0)
      .setSize(2*xUnit,yUnit);
      //.setInputFilter(ControlP5.FLOAT);
    
    cp5.addLabel("Y Label "+id)
      .setGroup(this.container)
      .setText("Y:")
      .setPosition(5*xUnit,0)
      .setSize(xUnit,yUnit);
    
    this.yInput = cp5.addTextfield("Y Field "+id)
      .setGroup(this.container)
      .setText("0")
      .setCaptionLabel("")
      .setPosition(6*xUnit,0)
      .setSize(xUnit*2,yUnit);
      //.setInputFilter(ControlP5.FLOAT);
      
    cp5.addButton("Remove "+id)
      .setCaptionLabel("-")
      .setGroup(this.container)
      .setPosition(9*xUnit,0)
      .setSize(yUnit,yUnit)
      .onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent event) {
          println(Nodes.size());
          Nodes.remove(this);
          println(Nodes.size());
          //I've tried every variation of removing the group,
          //they all give the same error, so for now I'm cheating 
          //container.remove();
          container.setVisible(false);
        }
      }
    );
  }
  
  void display() {
    fill(0);
    
    Float x = 0.0;
    Float y = 0.0;
    
    //Only parses value if verified
    try {
      x = Float.parseFloat(xInput.getText());
    }
    catch(NumberFormatException e) {}
    
    try {
      y = Float.parseFloat(yInput.getText());
    }
    catch(NumberFormatException e) {}
    //Set to center
    ellipse(15*xUnit+x, 20*yUnit-y, 5, 5);
  }
  
  //public void SetPos() {
  //  this.x = Float.parseFloat(xInput.getText());
  //}
  
  //public String ToString() {
  //  return "X: " + Float.toString(this.x) + ", Y: " + Float.toString(this.y);
  //}
  
}