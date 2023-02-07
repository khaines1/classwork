//kHaines Monte Carlo Simulation
import java.util.Random;
import java.util.Arrays;
class MonteCarloSImulation
{
	public static void main(String[] args) 
	{
		int nSimulations = 100000;//number of simulations
		int nComputers = 20;//number of computers
		double probInfected = 0.1;//probability computer is infected

		int[] cmpStatus = new int[nComputers];// 1 if infected 
		int[] cmpFlags = new int[nComputers];//1 if ever infected
		//array of all 1s. Loop sets all elements to 1
		int[] allInfected = new int[nComputers];
		for(int i = 0; i < nComputers; i++)
		{
			allInfected[i] = 1;
		}

		//variables to keep track of the number of days, infected, and flagged
		int allFlagged = 0;
		int dayCount = 0;
		int totalDays = 0;
		int nInfected; //Number of infected computers
		int totalInfected = 0;
		int n = 0;
		//simulation loop
		while(n < nSimulations)
		{
			//At beginning, one computer is infected
			cmpStatus[0] = 1;
			nInfected = 1;
			dayCount = 0;//reset number of days
			//simulate passing days: repeat until all clean
			while(nInfected > 0)
			{
				spread(cmpStatus, probInfected); 
				flag(cmpStatus, cmpFlags);
				nInfected = (countInfected(cmpStatus));
				
				clean(cmpStatus, nInfected);
				nInfected = (countInfected(cmpStatus));
				dayCount++; 
			}
			//Check if all computers are flagged after each simulation
			if(Arrays.equals(cmpFlags,allInfected))
			{
				allFlagged++;
			}
			totalDays = totalDays + dayCount;
			totalInfected = totalInfected + countFlags(cmpFlags);
			cleanFlags(cmpFlags);//clean flags before next simulation

			n++;
		}
		System.out.println("Simulations: " + nSimulations);
		System.out.println("Days: " + totalDays);
		System.out.println("Times all flags were raised: " + allFlagged);
		System.out.println("Total Infected: " + totalInfected);
		System.out.println();
		//Answers to questions
		double avgNumDays = ((double)totalDays/nSimulations);
		System.out.println("Average # of days: " + avgNumDays);
		double pAllWereInfected = ((double)allFlagged)/nSimulations;
		System.out.println("Probability all computers were infected at least once: " + 			pAllWereInfected);
		double avgInfected = ((double)totalInfected)/nSimulations;
		System.out.println("Average # infected: " + avgInfected);
		}
	//simulate spread of virus - perform bernouli trail for each infected to noninfected 	computer
	public static void spread(int[] cmpStatus, double probInfected)
	{
		for (int i = 0; i < cmpStatus.length; i++) 
		{
			for (int j = 0; j < cmpStatus.length; j++) 
			{
				if ((cmpStatus[i] == 1) && (cmpStatus[j] == 0)) 
				{
					int x = bernoulli(probInfected);
					if (x == 1) 
					{
						cmpStatus[j] = 2;
					}
				}
			}
		}
		//change the newly infected 2s to 1s
		for(int i = 0; i < cmpStatus.length; i++)
		{
			if(cmpStatus[i] == 2)
			{
				cmpStatus[i] = 1;
			}
		} 
	}
	//simulate bernoulli trial
	public static int bernoulli(double probInfected) 
	{
		double U = Math.random();
		int X;
		if (U < probInfected) 
		{
			X = 1;
		}
		 else 
		{
			X = 0;
		}
		return X;
	  }
	//cycle through each computer and flag(set to 1) if infected
	public static void flag(int[] cmpStatus, int[] cmpFlags)
	{
		for(int i = 0; i < cmpStatus.length; i++)
		{
			if(cmpStatus[i] == 1)
			{
				cmpFlags[i] = 1;
			}
		}
	}
	//cleans the flag array
	public static void cleanFlags(int[] cmpFlags)
	{
		for(int i = 0; i < cmpFlags.length; i++)
		{
			cmpFlags[i] = 0;
		}
	}

	//Randomly clean 5 computers 
	public static void clean(int[] cmpStatus, int nInfected)
	{
		int cleanCount = 0;
		int i = 0;
		//if less than 5 infected, clean all
		if(nInfected <= 5)
		{
			while(i < cmpStatus.length)
			{
				cmpStatus[i] = 0;
				nInfected--;
				i++;
			}
		}
		else//more than 5 infected clean 5 random
		{
			while(cleanCount < 5 )
			{
				if(cmpStatus[i] == 1)
				{
					double r = Math.random();
					if(r < 0.5)
					{
						cmpStatus[i] = 0;
						cleanCount++;
						nInfected--;
					}
				}
				i++;
				//if end of cmpStatus reached before 5 are cleaned, reset i to 0
				if(i == cmpStatus.length)
				{
					i = 0;
				}
			} 
		}
	}
	//count the number of infected computers
	public static int countInfected(int[] cmpStatus)
	{
		int nInfected = 0;//reset before counting
		int i = 0;
		while(i < cmpStatus.length)
		{
			if(cmpStatus[i] == 1)
			{
				nInfected++;
		}
		i++;
	}
	return nInfected;
	} 
	//count the number of flagged computers
	public static int countFlags(int[] cmpFlags)
	{
		int nFlags = 0;
		for(int i = 0; i < cmpFlags.length; i++)
		{
			if(cmpFlags[i] == 1)
			{
				nFlags ++;
			}
		}
		return nFlags;
	}
}
