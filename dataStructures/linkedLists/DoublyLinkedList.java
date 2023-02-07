import java.util.NoSuchElementException;
public class DoublyLinkedList<E>
{
    private Node head;
    private Node tail;
    private int size;

    public DoublyLinkedList()
    {
        size = 0;
    }

    private class Node
    {
        E element;
        Node next;
        Node prev;

        public Node(E element, Node next, Node prev)
        {
            this.element = element;
            this.next = next;
            this.prev = prev;
        }
    }
    public int size()
    {
        return size;
    }

    public boolean isEmpty()
    {
        return size == 0;
    }

    public void addFirst(E element)
    {
        Node top = new Node(element, head, null);//specifies data, next, and prev
        if(head != null) // if head != null, there is item there so must swap
        {
            head.prev = top; //put top before head
        }
        head = top; // make head point to top

        if(tail == null)
        {
            tail = top; // make tail top
        }
        size++;
        System.out.println("adding first: " + element);
    }

    public void addLast(E element)
    {
        Node bottom = new Node(element, head, null);

                         // put bottom after tail
       /* if(tail != null) // if tail != null, then item there so put item before
        {
            tail.prev = bottom;
        }*/
        
        while(bottom.next != null)
        {
            bottom = bottom.next;   
        }
       
        tail.next = bottom; // make tail point to bottom
        if(head == null) // if head null, item becomes head
        {
            head = bottom;
        }
        // make tail bottom
        size++;
        System.out.println("adding last: " + element);
    }

    public E removeFirst()
    {
        if(size == 0)
        {
            throw new NoSuchElementException();
        }
        Node top = head;
        head = head.next;
        head.prev = null;
        size--;
        System.out.println("deleting: " + top.element);
        return top.element;
    }

    public E removeLast()
    {
        if(size == 0)
        {
            throw new NoSuchElementException();
        }
        Node bottom = tail;
        tail = tail.prev;
        tail.next = null;
        size--;
        System.out.println("deleting: " + bottom.element);
        return bottom.element;
    }
    public void iterateForward()
    {
        System.out.println("iterating forward... ");
        Node top = head;
        while(top != null)
        {
            System.out.println(top.element);
            top = top.next;
        }
    }

    public void iterateBackward()
    {
        System.out.println("iterating backward...");
        Node top = tail;
        while(top != null)
        {
            System.out.println(top.element);
            top = top.prev;
        }
    }

    public static void main(String[] args)
    {
        DoublyLinkedList<Integer> dll = new DoublyLinkedList<Integer>();
        dll.addLast(222);
        dll.addFirst(10);
        dll.addFirst(23);
        dll.addFirst(42);
        dll.addFirst(55);
        dll.addLast(900);
        dll.iterateForward();
        dll.removeFirst();
        dll.removeLast();
    //    dll.iterateBackward();
    }
}