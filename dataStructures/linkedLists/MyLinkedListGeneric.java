import java.util.*;

public class MyLinkedListGeneric<E>
{

   private Node<E> first;
   
   public MyLinkedListGeneric()
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
      MyLinkedListGeneric<String> x = new MyLinkedListGeneric();
      x.addFirst("A");
      x.addFirst("B");
      x.addFirst("C");
      x.addFirst("D");
      x.addFirst("E");
      x.addFirst("M");
      
      Iterator<String> i = x.iterator();
      
      while(i.hasNext())
         System.out.println(i.next());
      
      System.out.println("Calling Remove()");
      
      Iterator<String> j = x.iterator();
      for(int a = 0; a < 3; a++)
      {
         j.next();
         j.remove();      
      }
      
      while(j.hasNext())
         System.out.println(j.next());
      
      
   }
      
}