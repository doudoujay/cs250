// customized printf for CS250 lab08
#include <stdio.h>
#include <stdarg.h>
//external functions
void printx(int);
void printd(int);

int myprintf(const char* format, ...){
  // get the base adress
  // parse the %
  int* pointer = (int*)&format;
  int i = 0;
  int argCount = 0;
  for(i; format[i] != '\0'; i++){
    c = format[i];
    if(c == '%'){
      //print % directly
      putchar(c);
    }
    if(c == 'c'){
      //single char
      pointer = pointer++;
      putchar(*pointer);
    }
    if(c == 's'){
      //string
      pointer = pointer++;
      for (int j = 0; (*pointer)[j] != '\0'; j++) {
        putchar((*pointer)[j]);
      }

    }
    if(c == 'x'){
      //hex
      pointer = pointer++;
      printx(*pointer);

    }
    if(c == 'd'){
      // decimal
      pointer = pointer++;
      printd(*pointer);

    }

  }

}
