#include "libasm.h"
#include <string.h>
#include <stdio.h>


int main(int ac, char *av[])
{
	char *str = "coucou je suis un texte\n";
	write(1, str, ft_strlen(str));
	ft_write(1, str, ft_strlen(str));
	perror("Error");
}
