#include <stdio.h>
#include <stdlib.h>

char* sub_string(char *in_string, int start_index, int end_index) {    
  /*index start from 1*/     
  char *out_string;
  int length = end_index-start_index+1;
  out_string = malloc(length+1);
  if(out_string == NULL){
  	printf("Memory allocation failed\n");
	exit(1);
  }
  int i;
  for (i=0;i<length;i++){
  	*(out_string+i) = *(in_string+start_index-1+i);
  }
  *(out_string+i) = '\0';
  return out_string;
}
