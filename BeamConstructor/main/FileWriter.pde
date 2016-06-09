import java.lang.*;
import java.io.*;

public void SaveNodesToFile(ArrayList<Node> nodes, String BeamLength)
{
  println(nodes);
  println(BeamLength);
    try
    {
        PrintWriter writer = new PrintWriter("C:/Projects/SeeBeam/file1.txt", "UTF-8");
        for (int i = 0; i < nodes.size(); i++) 
        {
            if (nodes.get(i).joins.size() > 0)
            {
                for (int j = 0; j < nodes.get(i).joins.size(); j++) 
                {
                    Node s = nodes.get(i);
                    Node e = nodes.get(nodes.get(i).joins.get(j));
                    String a = "0, " + s.yInput.getText() + ", " + s.xInput.getText();
                    String b = BeamLength + ", " + s.yInput.getText() + ", " + s.xInput.getText();
                    String c = "0, " + e.yInput.getText() + ", " + e.xInput.getText();
                    String d = BeamLength + ", " + e.yInput.getText() + ", " + e.xInput.getText();
                    writer.println(a + ", " + b + ", " + d + ", " + c);
                }
             }
        }
        writer.close();
    }
    catch(FileNotFoundException e){
     println("Failed to save file: " + e.getMessage());
    }
    catch(UnsupportedEncodingException e){
     println("Failed to save file: " + e.getMessage());
    }
    finally
    {
      println("Finished Saving Mesh");
    }
    
}