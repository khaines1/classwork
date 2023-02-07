import java.util.*;
public class MyLinkedListManual
{
    static class Node
    {
        public Object data;
        public Node next;
    }

    public static void main(String[] args)
    {
        Node x1 = new Node(); x1.data = "Ben";
        Node x1 = new Node(); x1.data = "Andy";
        Node x1 = new Node(); x1.data = "Cidny";
        Node x1 = new Node(); x1.data = "Derek";

        Node first = x1;
        x1.next = x2; x2.next = x3; x3.next = x4; x4.next = null;
        //System.out.println(first.data);
        //print first item

        //System.out.println(first.next.next.data);
        //print 3rd item

        Node temp = first;
        while(temp != null)
        {
            system.out.println(temp.data);
            temp = temp.next;
        }
    }
}