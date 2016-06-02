import controlP5.*;
import java.util.*;
import java.lang.*;

ControlP5 cp5;
CrossSection crossSectionShape;
PGraphics canvas;
  
void setup()
{
  size(1600, 900, P2D);  
  canvas = createGraphics(1300, 900, P2D);
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  crossSectionShape = new CrossSection();
  

  cp5.addButton("Create Node")
     .setValue(0)
     .setPosition(25,200)
     .setSize(200,50)
     .setId(1);
     
  cp5.addButton("Get Node")
     .setValue(0)
     .setPosition(275,200)
     .setSize(200, 50)
     .setId(2);
     
  cp5.addTextfield("Length")
     .setPosition(width - 275,25)
     .setSize(250,50)
     .setFont(font)
     .setId(3)
     .setColor(color(255,255,220))
     ;
     
  cp5.addTextfield("Segments")
     .setPosition(width - 275,130)
     .setSize(250,50)
     .setFont(font)
     .setId(4)
     .setColor(color(255,255,255))
     ;
     
}

void draw()
{
  background(140); 
  canvas.beginDraw();
  canvas.background(102);
  canvas.stroke(255);
  canvas.line(canvas.width*0.5, canvas.height*0.5, mouseX, mouseY);
  canvas.endDraw();
  image(canvas, 0, 0); 
}


public void controlEvent(ControlEvent theEvent) 
{
  
  switch (theEvent.getController().getId())
  {
    case(1):
      crossSectionShape.setLength(4500);
      println("Set Beam Length: 4500");
      float x = Float.parseFloat(cp5.get(Textfield.class,"X COORD").getText());
      float y = Float.parseFloat(cp5.get(Textfield.class,"Y COORD").getText());
      
      
      crossSectionShape.addNode(x,y);
      println("Create Node at X: " + Float.toString(x) + ", Y: " + Float.toString(y));
      break;
    case(2):
      println("Beam Length: " + Integer.toString(crossSectionShape.getLength()));
      println("Nodes:\n" + crossSectionShape.getNodes());
      break;
  }
  
}