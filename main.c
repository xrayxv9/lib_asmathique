#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	int fd = open("explications.txt", O_RDONLY);
	char str[100] = {'\0'};

	ft_read(fd, &str, 50);
	printf("str : %s\n", str);
	close(fd);
}
