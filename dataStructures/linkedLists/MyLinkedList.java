import java.util.*;
public class MyLinkedList
{
    class Node
    {
        public Object data;
        public Node next;
    }

    private Node first;
    public MyLinkedList()
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
    public void printRev(Node p)
    {
        Node temp = first;
        if(p != null)
        {
            printRev(p.next);
            System.out.println(p.data);
        }
    }
    public void printRev()
    {
        printRev(first);
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

    public Object removeFirst()//pop
    {
        if(first == null)
        {
            throw new NoSuchElementException();
        }
        Object element = first.data;
        first = first.next;
        return element;
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
            Node ptr, ptr1;     //ptr1 always points to the node
            ptr1 = first;       //before the one pointed to it by ptr
            ptr = first.next;   //ptr1 points to the first node
                                //ptr points to the node following ptr1
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
        MyLinkedList names = new MyLinkedList();
        names.addFirst("John");
        names.addFirst("Kim");
        names.addFirst("Karen");
        names.addFirst("Tron");

        names.print();
        names.printRev();
        System.out.println(names.size());
        //names.removeFirst();
        //names.removeLast();
        //System.out.println(names.size());
    }
}