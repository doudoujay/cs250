#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void memdump(char * p , int len) {
    // Add your code here.
    
    
}

struct X{
  char a;
  int i;
  char b;
  int *p;
};

struct List {
  char * str;
  struct List * next;
};

int main() {
  double y = 14;
  char str[20];
  int a = 66;
  int b = -77;
  struct X x;
  struct List * head;

  x.a = 'G';
  x.i = 42;
  x.b = '0';
  x.p = &x.i;
  strcpy(str, "Hello world\n");
  printf("&x=0x%x\n", &x.a);
  printf("&y=0x%x\n", &y);

  memdump((char *) &x.a, 64);
  head = (struct List *) malloc(sizeof(struct List));
  head->str=strdup("Greetings ");
  head->next = (struct List *) malloc(sizeof(struct List));
  head->next->str = strdup("from ");
  head->next->next = (struct List *) malloc(sizeof(struct List));
  head->next->next->str = strdup("CS250");
  head->next->next->next = NULL;
  printf("head=0x%x\n", head);
  memdump((char*) head, 128);
}

