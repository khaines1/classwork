import java.io.*;
import java.util.*;


public class ArrayQueue 
{
   public ArrayQueue()
   {
      list = new ArrayList();
   }
   
   public ArrayQueue(int capacity)
   {
      list = new ArrayList(capacity);
   }
   
   public Object dequeue()
   {
      return list.isEmpty() ? null : list.remove(0);
   }
   
   public Object front()
   {
      return list.isEmpty() ? null : list.get(0);
   
   }
   
   public Object back()
   {
      return list.isEmpty() ? null : list.get(list.size() - 1);
        
   }
   
   public void enqueue(Object element)
   {
      list.add(element);
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
   
   protected ArrayList list;


   public static void main(String[] args)
   {
      ArrayQueue s = new ArrayQueue(7);
      s.enqueue("monkey");
      s.enqueue("dragon");
      s.enqueue("tiger");

      System.out.println("Stack length = " + s.length());
      System.out.println((String) s.dequeue());
      System.out.println((String) s.dequeue());
      System.out.println((String) s.dequeue());
      System.out.println("Stack length = " + s.length());
      System.out.println(exp(2,3));

   }
   
  public static int exp(int base, int power)
  {
  
      if(power==0)
      {
         return 1;
      }
      else if(power == 1)
      {
         return base;
      }
      else 
      {
         return base * exp(base, power - 1);
      }
      
  }
   
}