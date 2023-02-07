import java.io.*;
 
class Rectangle implements java.io.Serializable
{
    protected int width;
    protected int length;
 
 
    public Rectangle(int w, int l)
    {
        this.width = w;
        this.length = l;
    }
	
	public int area()
	{
			return length*width;
	}
 
}
 
class SerializeTest
{
    public static void main(String[] args)
    {   
        Rectangle object = new Rectangle(4, 7);
        String filename = "file.ser";
         

        try
        {   

            FileOutputStream file = new FileOutputStream(filename);
            ObjectOutputStream out = new ObjectOutputStream(file);
             

            out.writeObject(object);
             
            out.close();
            file.close();
             
            System.out.println("Object has been serialized");
 
        }
         
        catch(IOException ex)
        {
            System.out.println("IOException is caught");
        }
 
 
        Rectangle object1 = null;
 

        try
        {   
   
            FileInputStream file = new FileInputStream(filename);
            ObjectInputStream in = new ObjectInputStream(file);
             

            object1 = (Rectangle)in.readObject();
             
            in.close();
            file.close();
             
            System.out.println("Object has been deserialized ");
            System.out.println("Length = " + object1.length);
            System.out.println("Width = " + object1.width);
			System.out.println("Area = " + object1.area());
        }
         
        catch(IOException ex)
        {
            System.out.println("IOException is caught");
        }
         
        catch(ClassNotFoundException ex)
        {
            System.out.println("ClassNotFoundException is caught");
        }
 
    }
}
