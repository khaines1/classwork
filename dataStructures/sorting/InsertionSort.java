import java.util.*;
public class InsertionSort
{
   public static void sort(int[] array)
   {
      int n = array.length;
      for(int i = 1; i < n; i++)
      {
         int j = i;
         int val = array[i];
         while((j > 0) && (array[j-1] > val))
         {
            array[j] = array[j-1];
            j--;
         }
         array[j] = val;
      }
   }
   
   public static void main(String[] args)
   {
      int[] array = {2,4,3,6,1};
      sort(array);
      System.out.println(Arrays.toString(array));
   }
}
