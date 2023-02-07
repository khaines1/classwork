import java.util.*;
public class BSTree {
   private Node root;
   public BSTree()
   {
      root = null;
   }
   class Node 
   {
      Comparable data;
      Node left;
      Node right;
     
   public void addNode(Node n)
   {
      int c = n.data.compareTo(this.data);
      if(c < 0)
      {
         if(this.left == null)
         { 
            this.left = n;
         }
         else
         { 
            this.left.addNode(n);  
         }
      }
      else if(c > 0) 
      {
         if(this.right == null) 
         { 
            this.right = n;
         }
         else
         { 
            this.right.addNode(n);  
         }
      }
   }
  }  
   public void add (Comparable obj)
   {
      Node n = new Node();
      n.data = obj;
      n.left = null;
      n.right= null;
      if(root == null)
      { 
         root = n; 
      }
      else 
      { 
         root.addNode(n);  
      }
   }
   public void print()
   { //print in order
      print(root);
      System.out.println();
   }
   private static void print(Node parent)
   {
      if (parent == null) 
      { 
         return; 
      }
      print(parent.left);
      System.out.println(parent.data+ " " );
      print(parent.right);
   }
   public void printPre()
   {
      printPre(root);
      System.out.println();
   }
   private static void printPre(Node parent)
   {
      if (parent == null) 
      { 
         return; 
      }
      printPre(parent.left);
      printPre(parent.right);
      System.out.println(parent.data+ " " );
   }
   public void printPost()
   {
      printPost(root);
      System.out.println();
   }
   private static void printPost(Node parent)
   {
      if (parent == null) 
      { 
         return; 
      }
      System.out.println(parent.data+ " " );   
      printPost(parent.left);
      printPost(parent.right);
         }
   
   public boolean search(Comparable obj)
   {
      Node current = root;
      while(current != null) 
      {
         int c = current.data.compareTo(obj);
         if(c == 0)
         {
            System.out.println("Item: " + obj + " found");
            return true;
         }
         else if(c < 0)
         {
            current = current.right;
         }
         else
         {
            current = current.left;
         }
      }
      System.out.println("Item: " + obj + " not found");
      return false;
   }
   
   public int size(Node n)
   {
      int countLeft = 0;
      int countRight = 0;
      if(n.left != null)
      {
         countLeft = size(n.left);
      }
      if(n.right != null)
      {
         countRight = size(n.right);
      }
      int count = countLeft + countRight;
      count++;
      return count;     
   }
 
   public Comparable max(Node n)
   {
      Node p = root;
      if(p == null)
      {
         return null;
      }
         while(p.right != null)
         {
            p = p.right; 
         }
     return p.data;
   }
   public Comparable min(Node n)
   {
      Node p = root;
      if(p == null)
      {
         return null;
      }
         while(p.left != null)
         {
            p = p.left; 
         }
     return p.data;
   }
   public static void main(String[] args){
      BSTree tree = new BSTree();
      tree.add("Tom");
      tree.add("Andy");
      tree.add("King");
      tree.add("Barney");
      tree.add("Mary");
      tree.print();
      tree.printPre();
      tree.printPost();
      
      tree.search("Anky");
      
   }
}
