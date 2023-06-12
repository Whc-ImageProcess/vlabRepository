#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#define Open(a1, a2, a3)                                        \
    do                                                          \
    {                                                           \
        if ((a1 = open(a2, a3)) < 0)                            \
            if (errno != EINTR {perror("open()"); exit(1); })   \
    } while (a1 < 0)


#define BUFSIZE 1024 // 缓冲区大小

int main(int argc, char **argv) {
    int sfd, dfd;
    char buf[BUFSIZE];
    int len, ret, pos;

    if(argc < 3) {
        fprintf(stderr, "Usage...\n");
        exit(1);
    }
	
    do {
        if((sfd = open(argv[1], O_RDONLY)) < 0) {
            if(errno != EINTR) {
                // 不是信号导致的错误，就退出
                perror("open()");
                exit(1);
            }
        }
    } while(sfd < 0)
	
    do {
        if((dfd = open(argv[2], O_WRONLY|O_CREAT|O_TRUNC, 0600)) < 0) {			
            if(errno != EINTR) {
                close(sfd);
                perror("open()");
                exit(1);
            }
    	}
    }while(dfd < 0)
    	

    while(1) {
        if((len = read(sfd, buf, BUFSIZE)) < 0) {
            if(errno == EINTR)
                continue;
            perror("read()");
            break;
        }
		
        if(len == 0)
            break;

        pos = 0;
        while(len > 0) {
            if((ret = write(dfd, buf + pos, len)) < 0) {
                if(errno == EINTR)
                    continue;
                perror("write()");
                exit(1);
            }
            pos += ret;
            len -= ret;
        }
    }
    close(dfd);
    close(sfd);

    exit(0);
}
