#include "msp.h"
/*
 * button_init.c
 *
 *  Created on: May 29, 2018
 *      Author: Aiku
 */

void button_init(void){

    P2->DIR &=~ BIT5;             //set P2.5 as input (column)
    P2->REN |= BIT5;
    P2->OUT &=~ BIT5;             //pull down resistors on P2.5

}



