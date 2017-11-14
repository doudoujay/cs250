#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define LINE_WIDTH 16
// dumps in hexadecimal,
// byte by byte the contents of memory starting
// at location “p” and continuing for len bytes.
void memdump(char * p , int len) {
  // Add your code here.
  int ASCII_UPPER = 127;
  int ASCII_LOWER = 32;


  char ans[LINE_WIDTH + 1];
  int i;
  for(i = 0; i < len; i++) {
    if(i % LINE_WIDTH == 0) {
      printf("0x%08x: ", (unsigned)p+i);
    }
    //get the value at p and truncate to one byte
    int c = p[i] & 0xFF;

    //print first byte as hex
    printf("%02X ", c);

    //if the char is between 32 and 127 then it is valid ascii other wise it is a .
    ans[i % LINE_WIDTH] = ((c >= ASCII_LOWER && c <= ASCII_UPPER) ? (char)c : '.');

    if((i + 1) % LINE_WIDTH == 0) {
      ans[i % LINE_WIDTH + 1] = '\0';
      printf(" %s\n", ans);
    }
  }

  if(i % LINE_WIDTH != 0) {
    ans[i % LINE_WIDTH] = '\0';
    //add correct padding and then print the leftover string
    for(i = i % LINE_WIDTH; i < LINE_WIDTH; i++) {
      printf("   ");
    }
    printf(" %s\n", ans);
  }

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
  printf("&head.next=0x%x\n", &(head->next));

  memdump((char *) &x.a, 64);
  head = (struct List *) malloc(sizeof(struct List));
  head->str=strdup("Greetings ");
  head->next = (struct List *) malloc(sizeof(struct List));
  head->next->str = strdup("from ");
  head->next->next = (struct List *) malloc(sizeof(struct List));
  head->next->next->str = strdup("CS250");
  head->next->next->next = NULL;
  printf("head=0x%x\n", head);
  memdump((char*) head, 256);
  int f1 = *(int*)&y;
  while(f1){
  	if(f1&1) printf("1");
  	else printf("0");
  	f1 >>=1;
  }
  printf("\n");
}
