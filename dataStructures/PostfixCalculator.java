//Kayla Haines
//CSC2720
//This class will evaluate a postfix equation with 
//single digit numbers and the + - * / % operations.

import java.util.Stack;
import java.util.Scanner;
public class PostfixCalculator
{
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        System.out.println("Hello. Type a postfix equation without spaces");
        String inputString = input.nextLine();

        int num1;
        int num2;
        int result = 0;
        Stack<Integer> stack = new Stack<Integer>();

        for(int i = 0; i < inputString.length(); i++)
        {
            char c = inputString.charAt(i);
            if(Character.isDigit(c))
            {
                int numValue = Character.getNumericValue(c);
                stack.push(numValue);
            }
            else
            {
                char op = inputString.charAt(i);
                if(op == '+')
                {
                    num2 = stack.pop();
                    num1 = stack.pop();
                    result = num1 + num2;
                }

                else if(op == '-')
                {
                    num2 = stack.pop();
                    num1 = stack.pop();
                    result = num1 - num2;
                }

                else if(op == '*')
                {
                    num2 = stack.pop();
                    num1 = stack.pop();
                    result = (num1 * num2);
                }

                else if(op == '/')
                {
                    num2 = stack.pop();
                    num1 = stack.pop();
                    result = num1 / num2;
                }

                else if(op == '%')
                {
                    num2 = stack.pop();
                    num1 = stack.pop();
                    result = (num1 % num2);
                }
                stack.push(result);
            }
        }
        System.out.println("The value is " + result);
    }
}
