/*
 * terminal_commands.h
 *
 *  Created on: May 17, 2018
 *      Author: Aiku
 */

#ifndef TERMINAL_COMMANDS_H_
#define TERMINAL_COMMANDS_H_

void choose_address(int horiz, int vert);
void move_right(int move);
void move_left(int move);
void move_down(int move);
void move_topleft(void);
void transmit_char(char data);
void hide_cursor(void);
void clear_screen(void);


#endif /* TERMINAL_COMMANDS_H_ */
