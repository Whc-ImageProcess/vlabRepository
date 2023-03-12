/*wraning: this code is buggy*/

#include "csapp.h"

void handler1(int sig)
{
	int olderrno = errno;

	// 这样去回收子进程的话，三个子进程会有一个进程成为僵尸进程
	// 
	if((waitpid(-1, NULL, 0)) < 0)
		sio_error("waitpid error");
	Sio_puts("Handler reaped child\n");
	Sleep(1);
	errno = olderrno;
}

void handler2(int sig)
{
	int olderrno = errno;

	// 这样就能确保三个子进程都能够被父进程回收
	while (waitpid(-1, NULL, 0) > 0)
	{
		Sio_puts("Handler reaped child\n");
	}
	if (errno != ECHILD)
	{
		Sio_error("waitpid error");
	}
	Sleep(1);
	errno = olderrno;
}

int main()
{
	int i, n;
	char buf[MAXBUF];

	// 转载SIGCHLD信号处理函数
	if(signal(SIGCHLD, handler2) == SIG_ERR)
		unix_error("signal error");

	/* Parent creates children */
	for(i = 0; i < 3; i++)
	{
		if(Fork() == 0)
		{
			printf("Hello from child %d\n", (int)getpid());
			// 每个子进程结束时，内核会发送一个SIGHLD信号通知父进程
			exit(0);
		}
	}

	/* Parent waits for terminal input and then processs it */
	if((n = read(STDIN_FILENO, buf, sizeof(buf))) < 0)
		unix_error("read");

	printf("Parent processing input\n");
	while(1)
		;

	exit(0);
}
