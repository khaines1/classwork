//Kayla Haines
//Feb 15 2021
//matrix multiplication using threads
//each thread computes one row

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define DIM 12 //matrix dimensions
#define NUM_THREADS 12 //number of threads

//global variables
int mat1[DIM][DIM];
int mat2[DIM][DIM];
int outMat[DIM][DIM];

//structure to store thread input info
struct tRow
{
	int row;
};

//Function Declarations
void matCopy(FILE *fp, int mat[][DIM]);
void* matrixMulter(void* params);
void printMatrix(int mat[][DIM]);

int main(int argc, char *argv[])
{   
	int i;
	FILE *fp;

	if(argc!=3){
		fprintf(stderr,"Usage: ./filename <mat1> <mat2>\n");
		return -1;
	}

	//open the files and copy contents into mat1 and mat2
	fp = fopen(argv[1],"r");
	matCopy(fp,mat1);
	fclose(fp);
	printf("loaded mat1\n");

	fp = fopen(argv[2],"r");
	matCopy(fp,mat2);
	fclose(fp);
	printf("loaded mat2\n");

	//r is passed into function as parameter.
	
	//loop for thread creation and joining
	for(i = 0; i < NUM_THREADS; i++)
	{
		struct tRow *r = (struct tRow *) malloc(sizeof(struct tRow));
		r->row = i;//passed into matrixMulter() to track row

		pthread_t tid; //thread identifier
		pthread_attr_t attr; //thread attributes
		pthread_attr_init(&attr); //set default attributes
		//create thread
		pthread_create(&tid, &attr, matrixMulter, r);
		printf("thread %d created\n",i);
		//wait for thread to finish before giving control back to main
		pthread_join(tid,NULL);
		printf("row %d completed!\n", i);
	}
	printf("Matrix multiplicaion completed!!\n");
	
	//print all three matrices
	printf("Matrix 1:\n");
	printMatrix(mat1);
	printf("Matrix 2:\n");
	printMatrix(mat2);
	printf("Matrix 1 * Matrix 2:\n");
	printMatrix(outMat);
    return 0;
}
//functions
void matCopy(FILE *fp, int mat[][DIM])
{
	//copies matrix from file as a 2d array
	int i;
	int j;
	for(i = 0; i < DIM; i++)
        {
                for(j = 0; j < DIM-1; j++)
                {
                        fscanf(fp,"%d ",&mat[i][j]);
                        //printf("%d ",mat[i][j]);
                }
                fscanf(fp,"%d\n",&mat[i][j]);
                //printf("%d\n",mat[i][j]);
        }
}

//function executed by each thread to calculate one row
void *matrixMulter(void *params)
{
	//multiplies the two matrices
	//r is the parameter structure passed into the function
	//r->row is a number coresponding to current row
	int i;
	int j;
	struct tRow *r = params;
	for(i = 0; i < DIM; i++)
	{
		for(j = 0; j < DIM; j++)
		{
			outMat[r->row][i] += mat1[r->row][j] * mat2[j][i];	
			//printf("%d ",outMat[r->row][i]);
		}
	}
	pthread_exit(0);
}

void printMatrix(int mat[][DIM])
{
	//prints matrix
	int i;
	int j;
	for(i = 0; i < DIM; i++)
        {
                for(j = 0; j < DIM-1; j++)
                {
                        printf("%d ",mat[i][j]);
                }
                printf("%d\n",mat[i][j]);
        }
}
