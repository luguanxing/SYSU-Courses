#include "AgendaUI.hpp"
#include <iostream>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*
ע�Ͳ��֣�linuxͬĿ¼�±�ֻ֤��һ��Agenda������
#include <sys/file.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <unistd.h>
*/
AgendaUI aui;

static void exitcheck(int sign) {
	Storage::getInstance()->sync();
	cout << "\n\nWaring:exiting program!\n\n" << endl;
	exit(1);
}

int main() {
/*
  ע�Ͳ��֣�linuxͬĿ¼�±�ֻ֤��һ��Agenda������
  int lock_file = open("/tmp/single_proc.lock", O_CREAT | O_RDWR, 0666);
  int rc = flock(lock_file, LOCK_EX | LOCK_NB);

  if (rc) {
    if (EWOULDBLOCK == errno) {
      cout <<"\n\nWaring:Only one Agenda can be running!\n\n" << endl;
      return 0;
    }
  }
  else {
  */
	signal(SIGINT, exitcheck);
    aui.OperationLoop();
    return 0;
 // }
}
