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

void str_merge_diff (char * arr_in1, char * arr_in2, char* arr_out);
int hamm_dist(int in1, int * arr1, int l_arr1);

int main()
{
    char str1[10] = "ABCDE";
    char str2[10] = "AQWDE";
    char out[20] = {0};
    str_merge_diff(str1, str2, out);
    printf("out: %s\n", out);
    int arr[3] = {1, 3, 4};
    printf("hamm: %d\n", hamm_dist(1, arr, 3));
}
