//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************

#include <stdio.h>

// Functions
// void some_asm_function();

// Variables
// type g_some_c_variable

int suma_int (int a, int b);
int suma_pole (int *pole, int n);
int pocet_cislic (char* str);
long max_pole (long *p, int n);

int main()
{
    printf("suma: %d\n", suma_int(5, 10));
    int pole[10] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    printf("suma pole: %d\n", suma_pole (pole, 10));
    printf ("cislic: %d\n", pocet_cislic ("Ah0j, 987"));
    long p[4] = {20, 600, 43, 88};
    printf ("max: %ld", max_pole(p, 4));
}   
