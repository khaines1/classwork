import java.util.*;
public class MyArrayStack
{
    private ArrayList list;

    public MyArrayStack()
    {
        list = new ArrayList();
    }
    
    public Object pop()
    {
        return list.isEmpty() ? null : list.remove(list.size()-1);
    }

    public void push(Object element)
    {
        list.add(element);
    }

    public Object top()
    {
        return list.isEmpty() ? null : list.get(list.size()-1);
    }

    public boolean isEmpty()
    {
        return list.size() == 0;
    }

    public int size()
    {
        return list.size();
    }

    public static void main(String[] args)
    {
        MyArrayStack s = new MyArrayStack();
        s.push("monkey");
        s.push("dragon");
        s.push("tiger");

        System.out.println("Stack length = " + s.size());
        System.out.println((String) s.pop());
        System.out.println((String) s.pop());
        System.out.println((String) s.pop());
        System.out.println("Stack length = " + s.size());
    }
}