import java.util.*;
public class MySortedLinkedList
{
    private Node first;
    class Node
    {
        public Object data;
        public Node next;
    }
   
    public MySortedLinkedList()
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
    public void addFirst(Object element)//push
    {
        Node newNode = new Node();
        newNode.data = element;
        newNode.next = first;
        first = newNode;
    }

    public boolean isEmpty()
    {
        return (first == null);
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
  
    public void numSort(MySortedLinkedList s)
    {
        Node temp = s.first;
    
         Node ptr2, ptr1;     
            ptr1 = temp;      
            ptr2 = temp.next; 
            
            while(ptr1 != null && ptr2 != null)
            {
                if(ptr1.data.compareTo(ptr2.data) < 0)
                {
                    temp.next = ptr1;
                    ptr1 = ptr1.next;
                   
                }
                else
                {
                    temp.next = ptr2;
                    ptr2 = ptr2.next;
                }
                temp = temp.next; 
            }
            
    }  
  
    public static void main(String[] args)
    {
        MySortedLinkedList nums = new MySortedLinkedList();
        nums.addFirst(1);
        nums.addFirst(2);
        nums.addFirst(3);
        nums.addFirst(4);

        nums.print();
        numsSort(nums);
    }
}