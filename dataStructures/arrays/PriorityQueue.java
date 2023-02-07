import java.io.*;
import java.util.*;

public class PriorityQueue
{
   class Entry //Inner Class
   {
   
      String str;
      int priority;
      
      public Entry(String o, int p)
      {
         str = o;
         priority = p > 5 ? 5 : p;
      }
      
   }

   protected ArrayList list;   
   
   public PriorityQueue()
   {
      list = new ArrayList();
   }
   
   public String dequeue()
   {
      String go = "";
        
      int temphigh =((Entry)list.get(0)).priority;
      int highindex = 0;
      
      for(int i = 0; i < list.size(); i++)
      {
         if(((Entry)list.get(i)).priority < temphigh)
         {
            temphigh = ((Entry)list.get(i)).priority;
            highindex = i;
         }
      }
      
      go =((Entry)list.get(highindex)).str;
      list.remove(highindex);
      return go;
      
      
            
   }      
   
   public void enqueue(String element, int priority)
   {
      Entry e = new Entry(element, priority);
      list.add(e);
   }
      
   public boolean isEmpty()
   {
      return list.isEmpty();
   }


   public int length()
   {
      return list.size();
   }
   
   public void clear()
   {
      list.clear();
   }      
   

   public static void main(String[] args)
   {
      PriorityQueue s = new PriorityQueue();
      
      s.enqueue("monkey",3);
      s.enqueue("dragon",2);
      s.enqueue("tiger",3);
      s.enqueue("abomination",5);
      System.out.println("Queue Length = " + s.length());
      System.out.println((String) s.dequeue());
      System.out.println((String) s.dequeue());
      System.out.println("Queue Length = " + s.length());
   
   
   }   



}