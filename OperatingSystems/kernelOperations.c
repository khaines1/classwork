//Kayla Haines
//Jan 22 2021
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/slab.h>
//Birthday structure
struct birthday
{
	int day;
	int month;
	int year;
};
//Student structure
struct student
{
	struct birthday dob;
	char gender[10];
	char name[20];
	struct list_head list;
};
/**
 * The following defines and initializes a list_head object named student_list
 */
static LIST_HEAD(student_list);

//when module is loaded
int simple_init(void)
{
	//creating multiple students
	struct student *student_one;
	struct student *student_two;
	struct student *student_three;
	struct student *student_four;
	struct student *student_five;
	//for finding longest name
	struct student *ptr;
	struct student *ptr2, *next;
	char longest[20];
	//inform user module has been loaded
	printk(KERN_INFO "Loading Module\n");
	//first student
	student_one = kmalloc(sizeof(*student_one), GFP_KERNEL);
	strcpy(student_one->gender, "female");
	strcpy(student_one->name, "Ann");
	student_one->dob.month = 12;
	student_one->dob.day = 21;
	student_one->dob.year = 1998;
	INIT_LIST_HEAD(&student_one->list);
	//add student to tail of linked list
	list_add_tail(&student_one->list, &student_list);
	printk(KERN_INFO "Added Student: %s  %s  %d/%d/%d\n",student_one->name, 
		student_one->gender,student_one->dob.month,
		student_one->dob.day,student_one->dob.year);
	//second student
        student_two = kmalloc(sizeof(*student_two), GFP_KERNEL);
        strcpy(student_two->gender, "male");
        strcpy(student_two->name, "Kevin");
	student_two->dob.month = 6;
        student_two->dob.day = 15;
        student_two->dob.year = 1994;
        INIT_LIST_HEAD(&student_two->list);
        list_add_tail(&student_two->list, &student_list);
	printk(KERN_INFO "Added Student: %s  %s  %d/%d/%d\n",student_two->name,
                student_two->gender,student_two->dob.month,
                student_two->dob.day,student_two->dob.year);

	//third student
        student_three = kmalloc(sizeof(*student_three), GFP_KERNEL);
	strcpy(student_three->gender, "male");
        strcpy(student_three->name, "Alexander");
	student_three->dob.month = 7;
        student_three->dob.day = 28;
        student_three->dob.year = 1996;
        INIT_LIST_HEAD(&student_three->list);
        list_add_tail(&student_three->list, &student_list);
	printk(KERN_INFO "Added Student: %s  %s  %d/%d/%d\n",student_three->name,
                student_three->gender,student_three->dob.month,
                student_three->dob.day,student_three->dob.year);

	//fourth student
        student_four = kmalloc(sizeof(*student_four), GFP_KERNEL);
	strcpy(student_four->gender, "female");
        strcpy(student_four->name, "Samantha");
	student_four->dob.month = 1;
        student_four->dob.day = 3;
        student_four->dob.year = 1995;
        INIT_LIST_HEAD(&student_four->list);
        list_add_tail(&student_four->list, &student_list);
	printk(KERN_INFO "Added Student: %s  %s  %d/%d/%d\n",student_four->name,
                student_four->gender,student_four->dob.month,
                student_four->dob.day,student_four->dob.year);

	//fith student
        student_five = kmalloc(sizeof(*student_five), GFP_KERNEL);
	strcpy(student_five->gender, "male");
        strcpy(student_five->name, "Bob");
	student_five->dob.month = 10;
        student_five->dob.day = 22;
        student_five->dob.year = 1996;
        INIT_LIST_HEAD(&student_five->list);
        list_add_tail(&student_five->list, &student_list);
	printk(KERN_INFO "Added Student: %s  %s  %d/%d/%d\n",student_five->name,
                student_five->gender,student_five->dob.month,
                student_five->dob.day,student_five->dob.year);

	//find female student with longest name
	list_for_each_entry(ptr, &student_list, list)
	{
		/* on each iteration, ptr points */
		/* to next student structure */
		if(strcmp(ptr->gender,"female") == 0)
		{
			if(strlen(ptr->name)>strlen(longest))
			{
				strcpy(longest,ptr->name);
			}
		}
	}
	//remove female student with logest name
	list_for_each_entry_safe(ptr2,next,&student_list,list)
	{
		if(strcmp(ptr2->name,longest) == 0)
		{
			list_del(&ptr2->list);
			kfree(ptr2);
			printk(KERN_INFO "Removing female student "
				"with Longest name: %s\n",longest);

		}
	}
	//send user updated list
	printk(KERN_INFO "remaining students:\n");
	list_for_each_entry(ptr, &student_list, list)
        {
		printk(KERN_INFO "Student: %s  %s  %d/%d/%d\n",ptr->name,
                ptr->gender,ptr->dob.month,
                ptr->dob.day,ptr->dob.year);
	}
        return 0;
}

void simple_exit(void)
{
	struct student *ptr, *next;
	//inform user program has reached the exit point
        printk(KERN_INFO "Removing Module\n");
	//remove remaining elements from list
	list_for_each_entry_safe(ptr,next,&student_list,list)
	{
		list_del(&ptr->list);
		kfree(ptr);
		printk(KERN_INFO "Student %s removed\n",ptr->name);
	}
}

module_init( simple_init );
module_exit( simple_exit );

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Kernel Data Structures");
MODULE_AUTHOR("SGG");
