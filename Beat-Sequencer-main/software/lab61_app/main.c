//// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
//// for ECE 385 - University of Illinois - Electrical and Computer Engineering
//// Author: Zuofu Cheng
//
int main()
{
	int i;
	volatile unsigned int *LED_PIO = (unsigned int*)0x90; //make a pointer to access the PIO block
	volatile unsigned int *SW_PIO = (unsigned int*)0x80; //make a pointer to access the PIO block
	volatile unsigned int *KEY0_PIO = (unsigned int*)0x70; //make a pointer to access the PIO block
	volatile unsigned int *KEY1_PIO = (unsigned int*)0x60; //make a pointer to access the PIO block


	*LED_PIO = 0; //clear all LEDs
	int flag = 0;
	while ( (1+1) != 3) //infinite loop
	{

		//reset
		if(*KEY0_PIO == 0){
			*LED_PIO &= 0x0; //clear LSB
		}
//
//		//accumulate
		if(*KEY1_PIO == 0 && flag == 0){
			*LED_PIO = (*LED_PIO + *SW_PIO)%0x100;
			flag = 1;
		}
		if(*KEY1_PIO == 1){
			flag = 0;
		}
	}
	return 1; //never gets here
}


//int main()
//{
//	int i = 0;
//	volatile unsigned int *LED_PIO = (unsigned int*)0x90; //make a pointer to access the PIO block
//
//	*LED_PIO = 0; //clear all LEDs
//	while ( (1+1) != 3) //infinite loop
//	{
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO |= 0x1; //set LSB
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO &= ~0x1; //clear LSB
//	}
//	return 1; //never gets here
//}
