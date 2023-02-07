import java.util.*;
public class MyLinkedListQueue
{
   class Node
   {
      public Object data;
      public Node next;
   }
   private Node first;
   public MyLinkedListQueue()
   {
      first = null;
   }
   public Object getFirst()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      return first.data;
   }
   public void enQueue(Object element)
   {
      Node newNode = new Node();
      newNode.data = element;
      newNode.next = first;
      first = newNode;
   }
   public boolean isEmpty()
   {
      return(first == null);
   }
   public void print()
   {
      Node temp = first;
      while(temp != null)
      { 
         System.out.println(temp.data);
         temp = temp.next;
      }
   }
   public int size()
   {
      Node temp = first;
      int count = 0;
      while(temp != null)
      {
         count ++;
         temp = temp.next;
      }
      return count;
   }
   public Object removeFirst()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      Object element = first.data;
      first = first.next;
      return element;
   }
   public void deQueue()//removeLast
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      
      if(first.next == null)
      {
         first = null; // mark list as empty
      }
      else
      {
         Node ptr, ptr1;   //ptr1 always points to the Node
                           //before the one pointed to it by prev
         ptr1 = first;     //ptr1 points to the first node
         ptr = first.next; // ptr point to the node following prev1
         
         while(ptr.next != null)
         {
            ptr1 = ptr;
            ptr = ptr.next;
         }
         ptr1.next = null;
      }
   }
   public static void main(String[] args)
   {
      MyLinkedListQueue names = new MyLinkedListQueue();
      names.enQueue("John");
      names.enQueue("Kim");
      names.enQueue("Karen");
      names.enQueue("Tron");
      
      names.print();
      System.out.println(names.size());
      names.deQueue();
      names.print();
      //names.removeLast();
      //System.out.println("Number of items in the list: " + names.size());
   }
}
