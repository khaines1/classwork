import java.util.*;
import java.io.*;
public class Hospital
{   
    Room room1 = new Room();
    Room room2 = new Room();
    Room room3 = new Room();
    

    public void assignRoom(HospitalQueue patients)
    {
        //Patient patient = patients.deQueue();
        if(room1.isEmpty())
        {
            room1.setPatient(patients.deQueue());
        }
        if(room2.isEmpty())
        {
            room2.setPatient(patients.deQueue());
        }
        if(room3.isEmpty())
        {
            room3.setPatient(patients.deQueue());
        }        
        //System.out.println("No room available. Placing " + patient.getName() + " on waiting list.");
    }
    
   
   public static void checkIn(HospitalQueue patients)
   {
        Scanner input2 = new Scanner(System.in);
        System.out.println("what is patient's name?");
        String pName = input2.nextLine();
        System.out.println("Assighn a priority value between 1 and 10 (1 > 10)");
        int pV = Integer.parseInt(input2.nextLine());
        while((pV < 1) || (pV > 10))
        {
            System.out.println("The value " + pV + " is not valid. Please choose a number between 1 and 10");
            pV = Integer.parseInt(input2.nextLine());
        }
        patients.enQueue(pName, pV);
        //If a room is avoilable, place first patient in queue in one.
        assignRoom(patients);
   }
   public static void checkOut(HospitalQueue patients)
   {
       System.out.println("Checking out, room available");
       //patients.deQueue();
       //if room becomes available, place first patient in queue in one.
       //assignRoom();
   }

    public static void printWaitList(HospitalQueue patients)
    {
        patients.print();
    }
    public static void main(String[] args)
    {
        HospitalQueue patients = new HospitalQueue();

        String in = "in";
        String out = "out";
        String list = "list";
        String exit = "exit";

        System.out.println("Welcome!");
        System.out.println("Type 'in' if you would like to check in a patient");
        System.out.println("Type 'out' if you would like to check out a patient");
        System.out.println("Type 'list' if you would like view the list of patients");
        System.out.println("Type 'exit' if you wish to leave this program");

        Scanner input = new Scanner(System.in);
        while(input.hasNext())
        {
            String choice = input.nextLine();
            if(choice.compareTo(in) == 0)
            {
                checkIn(patients);
            }
            if(choice.compareTo(out) == 0)
            {
                checkOut(patients);
            }
            if(choice.compareTo(list) == 0)
            {
                System.out.println("There are " + patients.size() + " patients waiting...");
                printWaitList(patients);
            }
            if(choice.compareTo(exit) == 0)
            {
                System.out.println("Goodbye");
                return;
            }
            System.out.println("Would you like to do something else?");
        }
      //assignRoom();
      //assignRoom(names.getFirstName());
      //names.deQueue();
    }
}
