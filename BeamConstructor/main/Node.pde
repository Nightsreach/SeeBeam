public class Node { 
  public Group container;
  public Textfield xInput;
  public Textfield yInput;
  public int id;
  public Toggle joinCheck;
  public List<Integer> joins = new ArrayList<Integer>();
  
  public Node() {
    //id is the next biggest number
    if(Nodes.size() > 0)
      this.id = Nodes.get(Nodes.size()-1).id+1;
    else
      this.id = 1;
    
    this.container = cp5.addGroup("Node "+id)
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
      .setId(id)
      .setCaptionLabel("-")
      .setGroup(this.container)
      .setPosition(9*xUnit,0)
      .setSize(yUnit,yUnit)
      .onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent event) {
          //Search through all nodes, remove all connections to node to be removed
          for(Node node : Nodes) { 
            for (int j = 0; j < node.joins.size(); j++) {
              if(Nodes.get(node.joins.get(j)).id == event.getController().getId()){
                node.joins.remove(j);
              }
            }
          }
          
          boolean removed = false;
          int i = Nodes.size()-1;
          //Seach through nodes again, but only until node to be removed is found
          while(i >= 0 && !removed) {
            if(Nodes.get(i).id == event.getController().getId()) {
              Nodes.remove(i);
              removed = true;
              //println("Delete" + node.id);
            }
            else {
              Nodes.get(i).container.setPosition(0,5*xUnit + ((i-1)*3*yUnit));
            }
            i--;
          }
          
          //I've tried every variation of removing the group,
          //they all give the same error, so for now I'm cheating 
          //container.remove();
          container.setVisible(false);
        }
      });
  }
  
  void display() {
    fill(0);
    Float[] position = getPosition(xInput,yInput);
    ellipse(position[0], position[1], 5, 5);
    for (int i = 0; i < joins.size(); i++) {
      // get position of corresponding node
      Float[] joinPos = getPosition(Nodes.get(joins.get(i)).xInput,Nodes.get(joins.get(i)).yInput);
      line(position[0], position[1], joinPos[0], joinPos[1]);
    }
  }
  
  Float[] getPosition(Textfield xInput, Textfield yInput) {
    Float xOrigin = (float)15*xUnit;
    Float yOrigin = (float)20*yUnit;
    Float[] position = {xOrigin,yOrigin};
    
    try {
      position[0] += Float.parseFloat(xInput.getText());
    }
    catch(NumberFormatException e) {}
    
    try {
      //Minus y value to bring it up-down, not down-up
      position[1] -= Float.parseFloat(yInput.getText());
    }
    catch(NumberFormatException e) {}
    
    return position;
  }
  
  public String ToString() {
    return "Node " + id + ": X: " + this.xInput.getText() + ", Y: " + this.yInput.getText() + ", Joins: " + this.joins;
  }
}