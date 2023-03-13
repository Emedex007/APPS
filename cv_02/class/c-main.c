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




// Sečtěte čísla v poli g_long_array do proměnné g_sum. V proměnné g_sum spočítejte počet výskytu 1 v případě, že je dělitelné 3. V opačném případě spočítejte počet výskytu 0.

// V poli g_char_array proveďte nahrazení znaku g_to_replace znakem zadaným v proměnné g_new. Vypište výsledné pole a počet nahrazených znaků.

// V proměnné g_mac_address najděte označení výrobce a dle polí g_vendor_oui a g_vendor_name vypište jeho název. Proměnnou g_mac_address upravte tak, aby část pro zařízení byla nulová.

void fst_fun();
void snd_fun();
void thrd_fun();

long g_long_array[5] = { 1153, 76, 52, 44211, 582362};
long g_sum = 0;
long g_count = 0;

char g_char_array[99] = "asfhsdufgauifu7fhhvuhfighafoadf";
char g_to_replace = 'a';
char g_new = '0';
int count = 0;

long g_mac_address = 0x309c2323ab65;
int g_vendor_oui[5] = {4120,3185699,14448460,3199042};
char g_vendor_name[5] = {'B','M','C','D','A'};
char vendor = 0;

int main()
{
    snd_fun();
    printf("text: %s\ncount: %d\n", g_char_array, count);
    fst_fun();
    printf("sum: %ld\nbits: %ld\n", g_sum, g_count);
    thrd_fun();
    printf("vendor: %c\naddress: %x\n", vendor, g_mac_address);
}
