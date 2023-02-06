#include <stdio.h>
#include <math.h>

double monthPay(double principal, double intRate, int payNum);
void printTable(double principal, double monthlyPay, int paymentNum, double intRate);

struct payment
{
	double principal;
	double interest;
	double balance;
	
};

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
	struct payment payments[100];
	
	payments[0].balance = principal;
	printf("#\t\tPayment\t\tPrincipal\tInterest\tBalance\n");
	int i;
	for(i = 0; i <= paymentNum; i++)
	{
		payments[i].interest = payments[i].balance * intRate/1200;
		payments[i].principal = monthlyPay - payments[i].interest;
		payments[i + 1].balance = payments[i].balance - payments[i].principal;
		printf("%d\t\t$%.2lf\t\t$%.2lf\t\t$%.2lf\t\t$%.2lf\n", i, monthlyPay,payments[i].principal, payments[i].interest, payments[i].balance);
	}
}
