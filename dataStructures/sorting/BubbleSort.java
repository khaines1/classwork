import java.util.*;
public class BubbleSort
{
    static void bubbleSort(int[] arr)
    {
        int n = arr.length;
        int temp = 0;
        
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < (n-i); j++)
            {
            	if(input[j] > input[j+1])
            	{
                	temp = arr[j-1];
                	arr[j-1] = arr[j];
                	arr[j] = temp;
                }
            }
        }
    }

    public static void main(String[] args)
    {
        int arr[] = {2,5,-2,3,7,13,-9,21};
        System.out.println("Array before bubble sort: " );
        System.out.println(Arrays.toString(arr));
        bubbleSort(arr);
        System.out.println("Array after bubble sort: ");
        System.out.println(Arrays.toSting(arr));
    }
}
