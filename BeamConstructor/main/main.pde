import controlP5.*;
import java.util.*;
import java.lang.*;

ControlP5 cp5;
CrossSection crossSectionShape;
PGraphics canvas;
ArrayList<Node> Nodes = new ArrayList<Node>();
int xUnit;
int yUnit;
PFont arial;
ControlFont smallFont;
ControlFont labelFont;

void setup() {
  size(1200, 700, P2D);
  //Each x and y unit is 1/40 of the window, used for easier positioning,
  //will probably be switched up when we get fixed positioning UI values.
  xUnit = int(width * 0.025);
  yUnit = int(height * 0.025);
  canvas = createGraphics(10*xUnit, height, P2D);
  
  cp5 = new ControlP5(this);
  
  //Could not figure out any better way of doing this,
  //the support for font alteration in cp5 is a mess.
  arial = createFont("Arial",12, true);
  smallFont = new ControlFont(arial);
  labelFont = new ControlFont(createFont("arial",20));
  
  //Default font size 12
  cp5.setFont(smallFont);
  
  crossSectionShape = new CrossSection();
  
  //All the UI stuff objects
  cp5.addGroup("Right Sidebar")
    .setPosition(30*xUnit,0)
    .setWidth(10*xUnit)
    .hideBar();
  
  cp5.addButton("Create Node")
    .setGroup("Right Sidebar")
    .setPosition(xUnit,height-3*yUnit)
    .setSize(3*xUnit,2*yUnit)
    .getCaptionLabel().toUpperCase(false);
     
  cp5.addButton("Join Nodes")
    .setGroup("Right Sidebar")
    .setPosition(6*xUnit,height-3*yUnit)
    .setSize(3*xUnit,2*yUnit)
    .getCaptionLabel().toUpperCase(false);
   
  cp5.addLabel("Length Label")
    .setGroup("Right Sidebar")
    .setText("Length:")
    .setPosition(xUnit,yUnit)
    .setSize(3*xUnit,2*yUnit)
    .setFont(labelFont);
  
  cp5.addTextfield("Length Field")
    .setGroup("Right Sidebar")
    .setCaptionLabel("")
    .setPosition(5*xUnit,yUnit)
    .setSize(4*xUnit,2*yUnit);
     
  cp5.addLabel("Segments Label")
    .setGroup("Right Sidebar")
    .setText("Segments:")
    .setPosition(xUnit,4*yUnit)
    .setSize(3*xUnit,2*yUnit)
    .setFont(labelFont);
    
  cp5.addTextfield("Segments Field")
    .setGroup("Right Sidebar")
    .setCaptionLabel("")
    .setPosition(5*xUnit,4*yUnit)
    .setSize(4*xUnit,2*yUnit);
  
  //cp5.addScrollableList("Nodes")
  //  .setGroup("Right Sidebar")
  //  .setPosition(0, 8*yUnit)
  //  .setSize(10*xUnit, 30*yUnit)
  //  .setBarHeight(0)
  //  .setItemHeight(20);
}

void draw() {
  background(140); 
  canvas.beginDraw();
  canvas.background(102);
  canvas.stroke(255);
  for (Node node : Nodes) {
     node.display();
  }
  canvas.endDraw();
  image(canvas, 30*xUnit, 0); 
}

public void controlEvent(ControlEvent theEvent) {
  
 switch (theEvent.getController().getName()) {
   case("Create Node"):
     if(Nodes.size() < 10)
       Nodes.add(new Node());
     //crossSectionShape.setLength(4500);
     //println("Set Beam Length: 4500");
     //float x = Float.parseFloat(cp5.get(Textfield.class,"X COORD").getText());
     //float y = Float.parseFloat(cp5.get(Textfield.class,"Y COORD").getText());
      
      
     //crossSectionShape.addNode(x,y);
     //println("Create Node at X: " + Float.toString(x) + ", Y: " + Float.toString(y));
     break;
   case("Join Nodes"):
     //println("Beam Length: " + Integer.toString(Nodes.getLength()));
     //println("Nodes:\n" + crossSectionShape.getNodes());
     break;
 }
 
}