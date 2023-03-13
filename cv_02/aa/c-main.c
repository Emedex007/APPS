#include "stdio.h"

long g_long_array[5] = { 1153, 76, 52, 44211, 582362};
long g_sum;
int g_ones_zeros;  // počet jedniček a nul

char g_char_array[99] = "asfhsdufgauifu7fhhvuhfighafoadf";
char g_to_replace = 'a';
char g_new = '!';
int replaced;
  
long g_mac_address = 0x309c2323ab65;
int g_vendor_oui[5] = {4120,3185699,14448460,3199042};
char g_vendor_name[5] = {'B','M','C','D','A'};
int mac;
char vendor;

void first_task();
void second_task();
void third_task();

int main() {
    first_task();
    printf("sum: %ld\n", g_sum);
    printf("ones and zeros: %d\n\n", g_ones_zeros);

    second_task();
    printf("Replaced: %d\nResult: %s\n\n", replaced, g_char_array);

    third_task();
    printf("MAC: %x\nVendor: %c\n", g_mac_address, vendor);
}
