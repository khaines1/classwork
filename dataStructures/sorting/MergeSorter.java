import java.util.*;
public class MergeSorter
{
   public static void sort(int[] a)
   {
      if(a.length <= 1)
      {
         return;
      }
      int[] first = new int[a.length / 2];
      int[] second = new int[a.length - first.length];
      //copy the first half of a into first, the second into second
      for(int i = 0; i < first.length; i++)
      {
         first[i] = a[i];
      }
      for(int i = 0; i < second.length; i++)
      {
         second[i] = a[first.length + i];
      }
      sort(first);
      sort(second);
      merge(first, second, a);
   }
   /* merges two sorted arrays into an array
      @param first the first sorted array
      @param second the second sorted array
      @param a the array into which to merge first and second*/
      
      private static void merge(int[] first, int[] second, int[] a)
      {
         int iFirst = 0;// next element to consider in the first array
         int iSecond = 0;// next element to consider in second aray
         int j = 0;// next open position in a
         //as long as neither iFirst or iSecond is past the end
         //move the smaller element into a
         while(iFirst < first.length && iSecond < second.length)
         {
            if(first[iFirst] < second[iSecond])
            {
               a[j] = first[iFirst];
               iFirst++;
            }
            else
            {
               a[j] = second[iSecond];
               iSecond++;
            }
            j++;
         }
         // only one of the two loops below copies entries
         // copy any remaining entries of the second array
         while(iFirst < first.length)
         {
            a[j] = first[iFirst];
            iFirst++;
            j++;
         }
         // copy any remaining entries of second into second half
         while(iSecond < second.length)
         {
            a[j] = second[iSecond];
            iSecond++;
            j++;
         }
      }
      
      public static void main(String[] args)
      {
         int[] a = {2,4,1,3,6,5,10,8,9,7};
         sort(a);
         System.out.println(Arrays.toString(a));
      }
}
