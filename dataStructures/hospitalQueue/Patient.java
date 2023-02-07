public class Patient
{
    private String name;
    private int priorityValue;
    private Patient nextP;
    
    //Constructor
 /*   Patient(String name, int priorityValue, Patient nextP)
    {
        this.name = name;
        this.priorityValue = priorityValue;
        this.nextP = null;
    }
    */
    
    public String getName()
    {
        return name;
    }
    public int getPriority()
    {
        return priorityValue;
    }

    public void setName(String name)
    {
        this.name = name;
    }
    public void setPriority(int priorityValue)
    {
        this.priorityValue = priorityValue;
    }
    public Patient getNextP()
    {
        return nextP;
    }
    public void setNextP(Patient nextP)
    {
        this.nextP = nextP;
    }
}