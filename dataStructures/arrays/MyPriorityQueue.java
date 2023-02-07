import java.util.*;
public class MyPriorityQueue
{
   class Entry// inner class is only for outer class
   {
      String str;
      int priority;
      
      public Entry(String o, int p)
      {
         str = o;
         priority = p;
      }
      
   } 
   protected ArrayList list;
   
   public MyPriorityQueue()
   {
      list = new ArrayList();
   }
   public MyPriorityQueue(int capacity)
   {
      list = new ArrayList(capacity);
   }
   public String dequeue()
   {
      String go = "";
      
      int temphigh = (((Entry)list.get(i)).priority);
      int highindex = 0;
      for(int i = 0; i < list.size(); i++)
      {
         if( ( (Entry)list.get(i) ).priority < temphigh)
         {
            temphigh = (((Entry)list.get(i)).priority);
            highindex = i;
         }

      }
      go = (((Entry)list.get(highindex)).str);
      
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
      MyPriorityQueue s = new MyPriorityQueue(7);
      
      s.enqueue("monkey", 1);
      s.enqueue("dragon", 4);
      s.enqueue("tiger", 2);
      s.enqueue("lion", 1);
      
      System.out.println("Queue length = " + s.length());
      
      System.out.println(((String)s.dequeue()));
      System.out.println(((String)s.dequeue()));

      System.out.println("Queue length = " + s.length());  
   }   
}
