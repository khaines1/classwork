import java.util.*;
public class SelectionSort
{
   public static void sort(int[] a)
   {
      for(int i=0;i < a.length-1;i++)
      {
         int minPos = minimumPosition(a, i);
         int temp = a[minPos];
         a[minPos] = a[i];
         a[i] = temp;
      } 
   }
   /* finds the smallest element in a tail range of the array.
      @param a the array to sort
      @param from the first position in a to compare
      @return the position of the smallest element in the 
      range a[from]....a[a.lenght-1]*/
      
      private static int minimumPosition(int[] a, int from)
      {
         int minPos = from;
         for(int i = from + 1; i < a.length; i++)
         {
            if(a[i] < a[minPos])
            {
               minPos = i;
            }
            
         }
         return minPos;
      }
      
      public static void main(String[] args)
      {
         int[] a = {1,4,7,2,3,6,5};
         sort(a);
         System.out.println(Arrays.toString(a));
      }
      
}

