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
// type g_some_c_variable;
void suma_pole();
void my_strlen();
int search_max();
void count_evens();
void count_vowels();

int g_int_pole [10] = {1,2,3,4,5,6,70,8,9,10};
int g_suma;

char g_str[] = "Nazdar programatori!";
char g_char_array[32] = "testovaci pole pro cv2";
char vowels[6] = "aeiouy";
int g_strlen;

int g_max;
int num;

int main()
{
    suma_pole();
    printf("suma: %d\n", g_suma );
    my_strlen();
    printf("len: %d\n", g_strlen);
    int l_max = search_max();       // vysledek ulozeny v eax
    printf("max: %d  %d\n", g_max, l_max);

}
