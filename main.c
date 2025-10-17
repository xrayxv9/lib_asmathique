#include "libasm.h"
#include <string.h>
#include <stdio.h>

// char *ft_strcpy(char *dest, char *src)
// {
// 	char *ptr = dest;
// 	while (*src)
// 	{
// 		*dest = *src;
// 		(dest)++;
// 		(src)++;
// 	}
// 	*dest = *src;
// 	return ptr;
// }

int main(int ac, char *av[])
{
	// if (ac == 2)
	// 	printf("%lu\n%lu\n", ft_strlen(av[1]), strlen(av[1]));
	// else if (ac == 3)
	// {
	// 	char *str = NULL;
	// 	ft_strlen(str);
	// }
	
	char str[7] = "cousin";
	char str_cpy[3] = "";

	char *coucou = ft_strcpy(str_cpy, str);
	// char *coucou = strcpy(str_cpy, str);
	printf("%s\n", coucou);
	return 0;
}
