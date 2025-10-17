#include "libasm.h"
#include <string.h>
#include <stdio.h>


int main(int ac, char *av[])
{
	if (ac != 3)
	{
		printf("Merci de mettre deux arguments stp \n");
		return 1;
	}
	printf("resultat : %d\n", ft_strcmp(av[1], av[2]));
	printf("original : %d\n", strcmp(av[1], av[2]));

}
