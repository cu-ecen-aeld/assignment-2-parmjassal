#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>


int main(int argc, char *argv[]) {
  int exitcode = 0;
  openlog("writer", LOG_PID | LOG_CONS, LOG_USER);
  if (argc != 3) {
    syslog(LOG_ERR, "Numer of required are 2 but found %d", argc);
    exitcode = 1;
    goto close_log;
  }
  FILE *fd = fopen(argv[1],"w");
  if (fd == NULL) {
    syslog(LOG_ERR, "Failed to create file");
    exitcode = 1;
    goto close_log;
  }
  syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
  fprintf(fd,"%s", argv[2]);
  fclose(fd);
  close_log:
    closelog();
  return exitcode;  
}
