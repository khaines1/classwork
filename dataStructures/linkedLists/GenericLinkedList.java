import java.util.*;

public class GenericLinkedList<E>
{

   private Node<E> first;
   
   public GenericLinkedList()
   {
      first = null;
   }
   public E getFirst()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      
      return first.data;
   }
   public E removeFirst()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      
      E element = first.data;
      first = first.next;
      return element;
   } 
   public void addFirst(E element)
   {
      Node<E> newNode = new Node<E>();
      newNode.data = element;
      newNode.next = first;
      first = newNode;
   }
    public void removeLast()//deQueue
    {
        if(first == null)
        {
            throw new NoSuchElementException();
        }
        if(first.next == null)
        {
            first = null; //mark list as empty
        }
        else
        {
            Node ptr, ptr1;     
            ptr1 = first;       
            ptr = first.next;   
                               
            while(ptr.next != null)
            {
                ptr1 = ptr;
                ptr = ptr.next;
            }
            ptr1.next = null;
        }
    }

    public void print()
    {
        Node<E> temp = first;
        while(temp != null)
        {
            System.out.println(temp.data);
            temp = temp.next;
        }
    }
   public Iterator<E> iterator()
   {
      return new MyIterator();
   }
   
   class Node<E>
   {
      public E data;
      public Node<E> next;
   }
   

   class MyIterator implements Iterator<E>
   {
      private Node<E> position;
      private Node<E> previous;
      private boolean isAfterNext;
      
      public MyIterator()
      {
         position = null;
         previous = null;
         isAfterNext = false;
      }
      
      public E next()
      {
         if(hasNext() == false)
         {
            throw new NoSuchElementException();
         }
         
         previous = position;
         isAfterNext = true;
         
         if(position ==  null)
         {
            position = first;
         }
         else
         {
            position = position.next;
         }
         
         return position.data;
      } 
      public boolean hasNext()
      {
         if(position == null)
         {
            return first != null;
         }
         else
         {
            return position.next != null;
         }
      }  
      public void remove()
      {
         if(isAfterNext == false)
         {
            throw new IllegalStateException();
         }
         
         if(position == first)
         {
            removeFirst();
         }
         else
         {
            previous.next = position.next;
         }
         position = previous;
         isAfterNext = false;
      }
      
   }
   public static void main(String[] args)
   {
      GenericLinkedList<String> names = new GenericLinkedList();
      names.addFirst("Adam");
      names.addFirst("Bob");
      names.addFirst("Kim");
      names.addFirst("David");
      
      names.print();
      System.out.println("RemoveLast");
      names.removeLast();
      names.print();

      GenericLinkedList<Integer> nums = new GenericLinkedList();
      nums.addFirst(1);
      nums.addFirst(2);
      nums.addFirst(3);
      nums.addFirst(4);

      Iterator<Integer> i = nums.iterator();
      System.out.println("Printing nums with iterator");
      while(i.hasNext())
         System.out.println(i.next());
      
      System.out.println("Removing nums with iterator");
      Iterator<Integer> j = nums.iterator();
      for(int a = 0; a < 3; a++)
      {
         j.next();
         j.remove();      
      }
      while(j.hasNext())
         System.out.println(j.next());  
   }    
}