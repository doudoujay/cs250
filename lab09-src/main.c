#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

#define READABLE_FILE "file_to_read.txt" /* File to be read during read operations */
#define BYTES_TO_READ_WRITE 819200 /* 800 KB */
#define MAX_BUFFER  1048576 /* 1 MB*/

/* Function for write without buffer */
void mywritec(char);

/* Functions for write with buffer */
void mywritebufsetup(int);
void myputc(char);
void mywriteflush(void);

/* Function for read without buffer */
int myreadc(void);

/* Functions for read with buffer */
void myreadbufsetup(int);
int mygetc(void);

/* Declare global variables for write operations here */
int fd_write = 1;

/* Declare global variables for read operations here */
int fd_read;

/* Main function starts */
int main()
{
    clock_t begin, end;
    int option, n, temp;
    const char *a="Writing byte by byte\n";
    const char *b="Writing using buffers\n";
    unsigned long i, bytes_to_write = BYTES_TO_READ_WRITE, bytes_to_read = BYTES_TO_READ_WRITE;
    char ch;

    while(1)
    {
        printf("\n 1 - Write without buffering \n 2 - Write with buffering");
        printf("\n 3 - Read without buffering \n 4 - Read with buffering");
        printf(("\n 5 - Exit \n Enter the option: "));
        scanf("%d", &option);
        switch(option)
        {
            case 1: /* Write without buffer */
                begin = clock();
                for (i=0;i<bytes_to_write;i++)
                {
                    ch = a[i%strlen(a)];
                    mywritec(ch);
                }
                end = clock();
                printf("\n Time to write without buffering: %f secs\n",(double)(end - begin)/CLOCKS_PER_SEC);
                break;

            case 2:  /* Write with buffer */
                printf("\n Enter the buffer size in bytes: ");
                scanf("%d", &n);
                mywritebufsetup(n);
                begin = clock();
                for (i=0;i<bytes_to_write;i++)
                {
                    ch = b[i%strlen(b)];
                    myputc(ch);
                }
                mywriteflush();
                end = clock();
                printf("\n Time to write with buffering: %f secs\n",(double)(end - begin)/CLOCKS_PER_SEC);
                break;

            case 3:  /* Read without buffer */
                fd_read = open(READABLE_FILE, O_RDONLY);
                if(fd_read < 0)
                {
                    printf("\n Error opening the readable file \n");
                    return 1;
                }
                begin = clock();
                for (i=0;i<bytes_to_read;i++)
                {  /* you may need to modify this slightly to print the character received and also check for end of file */
                    if(myreadc() == -1)
                    {
                        printf("\n End of file \n");
                        break;
                    }
                }
                end = clock();
                if(close(fd_read))
                {
                    printf("\n Error while closing the file \n ");
                }
                printf("\n Time to read without buffering: %f secs\n",(double)(end - begin)/CLOCKS_PER_SEC);
                break;

            case 4:  /* Read with buffer */
                printf("\n Enter the buffer size in bytes: ");
                scanf("%d", &n);
                myreadbufsetup(n);
                fd_read = open(READABLE_FILE, O_RDONLY);
                if(fd_read < 0)
                {
                    printf("\n Error opening the readable file \n");
                    return 1;
                }
                begin = clock();
                for (i=0;i<bytes_to_read;i++)
                { /* you may need to modify this slightly to print the character received and also check for end of file */
                    if(mygetc() == -1)
                    {
                        printf("\n End of file \n");
                        break;
                    }
                }
                end = clock();
                if(close(fd_read))
                {
                    printf("\n Error while closing the file \n ");
                }
                printf("\n Time to read with buffering: %f secs\n",(double)(end - begin)/CLOCKS_PER_SEC);
                break;

            default:
                return 0;
        }
    }
}

void mywritec(char ch) {
  /* Use the system call write() to write char 'ch' to standard output
   * (file descriptor 1)
   */
   write(1, ch, 1);
}

/* Use the C preprocessor to define constant MAX_BUFFER to be 1048576.
 * The constant will be the upper-bound on buffer size in this project.
 */

/* Declare a global array of MAX_BUFFER characters named "write_buf" that
 * will serve as an output buffer.
 */

/* Declare a global character pointer, wp, that will point to a location
 * in the buffer
 */

/* Declare a global integer, write_buf_size, that stores the size of the
 * output buffer in use at the current time.
 */

void mywritebufsetup(int n) {
  /* Verify that n is a positive integer less than or equal to MAX_BUFFER, and
   * store n in the global variable write_buf_size.
   */

  /* Initialize wp to point to the first byte of buffer. */
}



void myputc(char ch) {
  /* Store character ch in the location given by wp, and increment wp. */

  /* If the buffer is full (contains write_buf_size characters), write the
   * entire buffer to standard output using the write() system call and reset
   * wp to the initial location in the buffer.
   *
   * Note that myputc() will be called multiple times before the buffer is
   * completely written out.
   */
}

void mywriteflush(void) {
  /* Note: this function will be called after all calls to myputc() have been
   * made
   */

  /* If any characters remain in the write buffer, write them to standard output */
}

int myreadc(void) {
  /* Use the read() system call to read a character from the file descriptor
   * specified by 'fd_read'
   */

  /* If read() indicates end-of-file, return -1 to the caller. Otherwise,
   * return the character that was read in the low-order byte of the integer
   * return value. Be careful to avoid sign extension.
   */
}
/* Declare a global array of MAX_BUFFER characters named "read_buf" that will
 * serve as an input buffer.
 */

/* Declare a global character pointer, rp, that will point to the relevant
 * location in the buffer.
 */

/* Declare a global integer, read_buf_size, that stores the size of the input
 * buffer currently in use.
 */

/* Declare a global integer, read_count, that holds the number of bytes read. */

void myreadbufsetup(int n) {
  /* Verify that n is a positive integer less than or equal to MAX_BUFFER, and
   * store n in the global variable read_buf_size.
   */

  /* Set read_count to zero. */
}

int mygetc() {
  /* If read_count is less than or equal to zero, call read() to read up to
   * read_buf_size bytes into read_buf from the file descriptor specified by
   * 'fd_read'.
   */

  /* Set read_count to the number of bytes actually read. */

  /* Set rp to the first occupied slot in the buffer. If read_count is zero
   * (the read call reached the end-of-file), return -1 to the caller to indicate
   * end-of-file.
   */

  /* Extract the next character from the buffer, increment rp, and decrement
   * read_count.
   */

  /* Return the character extracted from the buffer in the low-order byte of an
   * integer (be careful to avoid sign extension).
   *
   * Note that this function will be called multiple times before the buffer is
   * emptied.
   */
}
