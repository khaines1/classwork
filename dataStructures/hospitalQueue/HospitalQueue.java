import java.util.*;
public class HospitalQueue
{
   
   private Patient first;
   public HospitalQueue()
   {
      first = null;
   }
   public Object getFirstName()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      return first.getName();
   }
   public Object getFirstPriority()
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      return first.getPriority();
   }
   //regular enqueue
   /* public void enQueue(String newName, int pV)
   {
      Patient newP = new Patient();
      newP.setName(newName);
      newP.setPriority(pV);
      newP.setNextP(first);
      first = newP;
   }*/

   // Enqueue and find proper location based on priority  
   public Patient enQueue(String newName, int pV)  
   {  
      // Create new Node  
      Patient newP = new Patient();
      newP.setName(newName);
      newP.setPriority(pV);
      if(first == null)
      {
         newP.setNextP(first);
         first = newP;
         return first;
      }

      Patient temp = first;  
      // Special Case: The head of list has lesser  
      // priority than new node. So insert new  
      // node before head node and change head node.  
      if (first.getPriority() < pV) 
      {  
         // Insert New Node before head  
         newP.setNextP(first);  
         first = newP;  
         return first;
      }  
      else 
      {  
         // Traverse the list and find a  
         // position to insert new node  
         while (temp.getNextP() != null && temp.getNextP().getPriority() > pV) 
         {  
               temp = temp.getNextP();  
         }  
         // Either at the ends of the list  
         // or at required position  
         newP.setNextP(temp.getNextP());  
         temp.setNextP(newP);  
      }  
      return first; 
   }

   public boolean isEmpty()
   {
      return(first == null);
   }
   public void print()
   {
      Patient temp = first;
      while(temp != null)
      { 
         System.out.println("Patient name: " + temp.getName() + "       Patient priority: " + temp.getPriority());
         temp = temp.getNextP();
      }
   }
   public int size()
   {
      Patient temp = first;
      int count = 0;
      while(temp != null)
      {
         count ++;
         temp = temp.getNextP();
      }
      return count;
   }
  
   public Patient deQueue()//removeFirst
   {
      if(first == null)
      {
         throw new NoSuchElementException();
      }
      
      if(first.getNextP() == null)
      {
         first = null; // mark list as empty
      }
      else
      {
         Patient ptr, ptr1;   //ptr1 always points to the Node
                           //before the one pointed to it by prev
         ptr1 = first;     //ptr1 points to the first node
         ptr = first.getNextP(); // ptr point to the node following prev1
         
         while(ptr.getNextP() != null)
         {
            ptr1 = ptr;
            ptr = ptr.getNextP();
         }
         ptr1.setNextP(null);
      }
      return first;
   }
  /* public static void main(String[] args)
   {
      HospitalQueue names = new HospitalQueue();
      names.enQueue("John", 10);
      names.enQueue("Kim", 4);
      names.enQueue("Karen", 5);
      names.enQueue("Tron", 8);
      
      names.print();
      System.out.println(names.size());
      names.deQueue();
      names.print();
      //names.removeLast();
      //System.out.println("Number of items in the list: " + names.size());
   }*/
}
