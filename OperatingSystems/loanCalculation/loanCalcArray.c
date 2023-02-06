#include <stdio.h>
#include <math.h>

double monthPay(double principal, double intRate, int payNum);

void printTable(double principal, double monthlyPay, int paymentNum, double intRate);
int main()
{
	double principal;
	double intRate;
	int paymentNum;

	//get loan info from user
	printf("Enter loan amount: ");
	scanf("%lf", &principal);
	printf("Enter interest rate: ");
	scanf("%lf", &intRate);
	printf("Enter number of payments: ");
	scanf("%d", &paymentNum);

	double monthlyPay = monthPay(principal, intRate, paymentNum);
	
	printf("The monthly payment should be: %.2lf\n", monthlyPay);
	printTable(principal, monthlyPay, paymentNum, intRate);
	return 0;
}
// calculate mothly payment
double monthPay(double principal, double intRate, int payNum)
{
	double monthlyPay;
	double r = intRate/1200;
	double n = payNum;// * 12;
	double rp = pow(1 + r, n);
	
	monthlyPay = principal *((r * rp)/(rp - 1));
	return monthlyPay;
}
	

// print Amortization table
void printTable(double principal, double monthlyPay, int paymentNum, double intRate)
{
	int n = paymentNum;
	double newBalance[10] = {0};
	newBalance[0] = principal;
	double intPaid[10] = {0};
	double princPaid[10] = {0};
	
	printf("#\t\tPayment\t\tPrincipal\tInterest\tBalance\n");
	int i;
	for(i = 0; i <= paymentNum; i++)
	{
		intPaid[i] = newBalance[i] * intRate/1200;
		princPaid[i] = monthlyPay - intPaid[i];
		newBalance[i+1] = newBalance[i] - princPaid[i];
		printf("%d\t\t$%.2lf\t\t$%.2lf\t\t$%.2lf\t\t$%.2lf\n", i, monthlyPay, princPaid[i], intPaid[i], newBalance[i]);
	}
}
