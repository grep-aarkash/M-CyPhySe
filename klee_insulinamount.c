#include<klee/klee.h>


/* The v1 of the prototype. It takes into consideration the basal_rates, insulin levels and the blood
glucose defined by the user. Every time the program is run, it generates a random insulin inside the body
value and the blood glucose of the person. The basal_rate which is the rate of metabolism change in a user
is kept fixed by me for the time being.
*/

int insulin(int x, int y){
  int delta = x - y;
  if (delta > 5){
    return delta;
  }

  return 0;
}




int main() {


  
  //int insulin =  rand() % 30;
  int blood_glucose;
  
  //In order to maintain stability, this is the value of the target_bg
  int target_bg = 45;
 klee_make_symbolic(&blood_glucose, sizeof(blood_glucose), "a");
 //klee_make_symbolic(&target_bg, sizeof(target_bg), "b");

 return insulin(blood_glucose, target_bg);
}

/*The delta difference, is the parameter which tells if insulin needs to be injected
*/

