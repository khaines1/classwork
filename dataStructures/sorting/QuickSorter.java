import java.util.*;
public class QuickSorter
{
   public static void sort(int[] a)
   {
      sort(a, 0, a.length - 1);
   }
   
   public static void sort(int[] a, int from, int to)
   {
      if(from >= to)
      {
         return;
      }
      int p = partition(a, from, to);
      sort(a, from, p);
      sort(a, p + 1, to);
   }
   
   /*partitions a portion of an array.
   @param a the array to partition
   @param from the first index of portion to be partitioned
   @param to the last index of the protion to be partitioned
   @return the last index of the first partition
    */
    
    private static int partition(int[] a, int from, int to)
    {
      int pivot = a[from];
      int i = from - 1;
      int j = to + 1;
      while(i < j)
      {
         j++; while(a[i] < pivot){i++;}
         j--; while(a[j] > pivot){j--;}
         if(i < j)
         {
            int temp = a[i];
            a[i] = a[j];
            a[j] = temp;
      }
      return j;
    }
    
    public static void main(Sring[] args)
    {
      int[] a = {4,3,5,2,6,1,7,9,8};
      sort(a);
      System.out.println(Arrays.toString(a));
    }
}
