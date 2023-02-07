public class Room
{
    private Patient patient;
    private boolean isEmpty;
    
    Room()
    {
        isEmpty = true;
    }
    
    public void setPatient(Patient patient)
    {
        this.patient = patient;
    }
    public Patient getPatient()
    {
        return patient;
    }
    public boolean isEmpty()
    {
        return isEmpty == true;
    }
}