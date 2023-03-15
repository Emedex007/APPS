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

void str_merge_diff (char* arr_in1, char* arr_in2, char* arr_diff);
int hamm_dist (int n, int * arr1, int *arr2);

int main()
{
    char str1[10] = "holj";
    char str2[10] = "hokj";
    char out[10] = {0};
    str_merge_diff(str1, str2, out);
    printf("diff: %s\n", out);

    
}
