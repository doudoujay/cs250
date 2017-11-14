// customized printf for CS250 lab08
#include <stdio.h>
#include <stdarg.h>
//external functions
void printx(int);
void printd(int);

int myprintf(const char* format, ...){
  // get the base adress
  // parse the %
  void** pointer = (void**)&format;
  int i = 0;
  char c;
  for(; (char)format[i] != '\0'; i++){
 	while( format[i] != '%' ) { 
 	if((char)format[i] == '\0'){
 		return 0;
 	}
              putchar(format[i]);
              i++; 
    } 
    i++;
    c = format[i];
    if(c == '%'){
      //print % directly
      putchar(c);
    }
    if(c == 'c'){
      //single char
      //leaves only the least significant byte
      putchar((unsigned int)(*++pointer) & 0xFF);
    }
    if(c == 's'){
      //string
      // the value of pointer is another char pointer
      // the value of that char pointer is char
      char* str = *(++pointer);
      while(*str){
      	putchar(*str++);
      }

    }
    if(c == 'x'){
    	//hex
      printx((unsigned int)(*++pointer));
      

    }
    if(c == 'd'){
      // decimal
      printd((int)(*++pointer));

    }
    

  }

}
