#include<stdio.h>
#include<stdlib.h>

/* The v1 of the prototype. It takes into consideration the basal_rates, insulin levels and the blood
glucose defined by the user. Every time the program is run, it generates a random insulin inside the body
value and the blood glucose of the person. The basal_rate which is the rate of metabolism change in a user
is kept fixed by me for the time being.
*/
int main(int argc, char const *argv[]) {

  // Define the three terms which are being used in the
  int basal_rates = 2;
  int insulin =  rand() % 30;
  int blood_glucose = rand() % 50;
  printf("%d %d %d\n", basal_rates, insulin, blood_glucose);
  //In order to maintain stability, this is the value of the target_bg
  int target_bg = 45;

/*The delta difference, is the parameter which tells if insulin needs to be injected
*/
  int delta = blood_glucose - target_bg;
  if (delta > 5){
    printf( "Amount to be injected is ");
    printf("%d\n", delta);
  }
  return 0;
}
