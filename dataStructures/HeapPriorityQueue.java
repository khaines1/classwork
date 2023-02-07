import java.util.Arrays;
import java.util.NoSuchElementException;

public class HeapPriorityQueue
{
   private int[] elementData;
   private int size;
   public HeapPriorityQueue()
   {
      elementData = new int[10];
      size = 0;
   }

   public void add(int value)
   {
      //resize if necessary
      if(size + 1 >= elementData.length)
      {
         elementData = Arrays.copyOf(elementData, elementData.length * 2);
      }
      //insert as new rightmost leaf
      elementData[size + 1] = value;
      
      //"Trickle up" toward root as necessary to fix ordering
      int index = size + 1;
      boolean found = false; // have we found the proper place yet?
      while(!found && hasParent(index))
      {
         int parent = parent(index);
         if(elementData[index] < elementData[parent])
         {
            swap(elementData, index, parent(index));
            index = parent(index);
         }
         else
         {
            found = true; //found proper location; stop the loop
         }
      }
      size++;
   }
   public boolean isEmpty()
   {
      return size == 0;
   }
   public int peek()
   {
      if(isEmpty())
      {
         throw new NoSuchElementException();
      }
      return elementData[1];
   }
   public int remove()
   {
      int result = peek();
      //move rightmost leaf to become new root
      elementData[1] = elementData[size];
      size--;
      
      //"Trickle down root as necessary to fix order
      int index = 1;
      boolean found = false; //have we found the proper place yet?
      while(!found && hasLeftChild(index))
      {
         int left = leftChild(index);
         int right = rightChild(index);
         int child = left;
         if(hasRightChild(index) && elementData[right] < elementData[left])
         {
            child = right;
         }
         if(elementData[index] > elementData[child])
         {
            swap(elementData, index, child);
            index = child;
         }
         else
         {
            found = true; //found proper location, end loop
         }
      }
      return result;
   }
   public int size() {return size;}
   
   private int parent(int index){return index / 2;}
   
   private int leftChild(int index){return index * 2;}
   
   private int rightChild(int index){return index * 2 + 1;}
   
   private boolean hasParent(int index){return index > 1;}
   
   private boolean hasLeftChild(int index){return leftChild <= size;}
   
   private boolean hasRightChild(int index){return rightChild <= size;}
   
   private void swap(int[] a, int index1, int index2)
   {
      int temp = a[index]; a[index1] = a[index2]; a[index2] = temp;
   }

   public static void main(String[] args)
   {
      HeapPriorityQueue heap = new HeapPriorityQueue();
      heap.add(5);
      heap.add(10);
      heap.add(3);
      heap.add(10);
      heap.add(6);
      
      System.out.println(heap.remove());
   }

}
