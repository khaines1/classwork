import java.util.*;

class bubble
{
   public static void main(String args[])
   {
      int[] a = new int[7];
      a[0] = 15;
      a[1] = 13;
      a[2] = 7;
      a[3] = 14;
      a[4] = 6;
      a[5] = 4;
      a[6] = 18;
      
      int[] b = {13,181,2,67,74,24,18};
      int[] c = {465,761,1,51,1561,198,19,48};
      int[] d = {9,18,117,216,315,414,513,612,711,810};

      selectionSort(a);
      bubbleSort(c);
      //insert(d);
      mergeSort(b);
      
             
   }

   public static int[] bubbleSort(int[] input)
   {
      for(int i = 0; i < input.length - 1; i++)
      {
         for(int j = 0; j < input.length- 1; j++)
         {
            if(input[j] > input[j+1])
            {
               int tempVar = input[j +1];
               input[j +1] = input[j];
               input[j] = tempVar;
            }
         }
         
      }
      
      System.out.println("Calling Bubble Sort\n" + Arrays.toString(input));
      return input;
      
   }
   
   public static int[] selectionSort(int[] a) 
   {
      for (int i = 0; i < a.length - 1; i++) 
      {
          int min = i;
          
          for (int j = i + 1; j < a.length; j++) 
          {
              if (a[j] < a[min]) 
              {
                  min = j;
              }
          }
           swap(a, i, min);
          
      }
   
      System.out.println("Calling Selection Sort\n" + Arrays.toString(a));
      return a;
   
   }

   public static void swap(int[] a, int i, int j) 
   {
      if (i != j) 
      {
          int temp = a[i];
          a[i] = a[j];
          a[j] = temp;
      }

   }
   public static int minimumPosition(int[] a, int from)
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
   
   public static int find(int[] input, int target)
   {
      for(int i = 0; i < input.length - 1; i++)
      {
         if(input[i] == target)
         {
            return 1;
         }
      }
      return -1;
   }
   //Start at second element an move it to the proper position
   public static void insert(int[] array)
   {
      int n = array.length;
      for(int i = 1; i < n - 1; i++)
      {
         int j = i;
         int val = array[i];
         
         while((j > 0) && (array[j+1] > val))
         {
            array[j] = array[j -1];
            j--;
         }
         array[j] = val;
         
      }
      System.out.println("Calling Insertion Sort\n" + Arrays.toString(array));
   }
   
   public static void mergeSort(int[] a)
   {
      if(a.length <= 1)
      {
         return;
      }
      int[] first = new int[a.length /2];
      int[] second = new int[a.length - first.length];
      
      for(int i = 0; i < first.length; i++)
      {
         first[i] = a[i];
      }
      for(int i = 0; i < second.length; i++)
      {
         second[i] = a[first.length + i];
      }
      mergeSort(first);
      mergeSort(second);
      merge(first, second, a);
            
   }
   
   public static void merge(int[] first, int[] second, int[] a)
   {
      int First = 0;
      int Second = 0;
      int j = 0;
      
      while(First < first.length && Second < second.length)
      {
         if(first[First] < second[Second])
         {
            a[j] = first[First];
            First++;
         }
         else
         {
            a[j] = second[Second];
            Second++;
         }
         j++;
      }
      
      while (First < first.length)
      {
         a[j] = first[First];
         First++; j++;
      }
      
      while(Second<second.length)
      {
         a[j] = second[Second];
         Second++; j++;
      }
      
      System.out.println("Calling Merge Sort");
      System.out.println(Arrays.toString(a));
      
   }
   
   
}
