/*
 * CPU stress app for PuzzleHype exp
 * Copyright (C) 2022 Ho-Ren (Jack) Chuang <horenc@vt.edu>
 *
 * Distributed under terms of the MIT license.
 *
 * Compile:
 *		gcc stress50.c -o stress -lm
 *		gcc stress70.c -o stress -lm
 *		gcc stress80.c -o stress -lm
 *		gcc stress100.c -o stress -lm
 */

#include <stdio.h>
#include <limits.h> // INT_MAX
#include <unistd.h> // usleep()
#include <math.h> // sqrt

//#define OUTTER_LOOP (INT_MAX)
#define OUTTER_LOOP (unsigned long)((unsigned long)INT_MAX * 3)
/* larger  = sleep less */
//#define INNER_LOOP (1000*5) // host 10%
//#define INNER_LOOP (1000*5*10) //
//#define INNER_LOOP (1000*5*10) // guest 8%
//#define INNER_LOOP (1000*5*10*10) // guest 50%
#define INNER_LOOP (unsigned long)((unsigned long)1000*5*10*10*4)

#define FIXED_INPUT_NUMBER ((OUTTER_LOOP/10)*9)

int main() {
    unsigned long i, j = 0;
    double number, squareRoot = 0;

    //printf("Enter a number: ");
    //scanf("%lf", &number);

    for (i = 0; i < OUTTER_LOOP; i++) {
        //number = i;
        number = FIXED_INPUT_NUMBER;

        // computing the square root
        squareRoot += sqrt(number);
		squareRoot += i;
        //printf("Square root of %.2lf =  %.2lf\n", number, squareRoot);

        /* maitain ratio */
        j++;
        if (j >= INNER_LOOP) {
            j = 0;
            usleep(1);
        }
    }

    return (int)squareRoot;
}
