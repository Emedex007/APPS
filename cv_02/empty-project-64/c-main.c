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

int g_int_pole [10] = {1,2,3,4,5,6,7,8,9,10};
int g_suma;

char g_str[] = "Nazdar programatori!";
int g_strlen;

int main()
{
    suma_pole();
    printf("suma: %d\n", g_suma );
    my_strlen();
    printf("len: %d\n", g_strlen);

}
