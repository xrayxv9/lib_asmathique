#include "libasm.h"
#include <errno.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// int main()
// {
// 	printf(BLUE" <<<<<<<<<< strlen >>>>>>>>>>\n" RESET);
// 	{
// 		char str[] = "coucou";
//
// 		printf("%lu\n", strlen(str));
// 	}
// 	printf(BLUE"\n <<<<<<<<<< ft_strlen >>>>>>>>>>\n" RESET);
// 	{
// 		char str[] = "coucou";
//
// 		printf("%lu\n", ft_strlen(str));
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< ft_strcpy >>>>>>>>>>\n" RESET);
// 	{
// 		char dest[] = "coucou";
// 		char src[] = "nothing here";
// 		printf("%s\n", ft_strcpy(dest, src));
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< strcpy >>>>>>>>>>\n" RESET);
// 	{
// 		char dest[] = "coucou";
// 		char src[] = "nothing here";
// 		printf("%s\n", strcpy(dest, src));
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< strcmp >>>>>>>>>>\n" RESET);
// 	{
// 		char dest[] = "coucou je suis un text";
// 		char src[] = "coucou je suis un text";
// 		printf("%d\n", strcmp(dest, src));
//
// 		char dest2[] = "coucou";
// 		char src2[] = "couco";
// 		printf("%d\n", strcmp(dest2, src2));
// 		
// 		char dest3[] = "couc";
// 		char src3[] = "couco";
// 		printf("%d\n", strcmp(dest3, src3));
//
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< ft_strcmp >>>>>>>>>>\n" RESET);
// 	{
// 		char dest[] = "coucou je suis un text";
// 		char src[] = "coucou je suis un text";
// 		printf("%d\n", ft_strcmp(dest, src));
//
// 		char dest2[] = "coucou";
// 		char src2[] = "couco";
// 		printf("%d\n", ft_strcmp(dest2, src2));
//
// 		char dest3[] = "couc";
// 		char src3[] = "couco";
// 		printf("%d\n", ft_strcmp(dest3, src3));
//
// 	}
//
//
// 	printf(BLUE"\n <<<<<<<<<< write >>>>>>>>>>\n" RESET);
// 	{
// 		int fd = open("test.txt", O_WRONLY);
//
// 		char *str = "coucou je suis l'original\n";
// 		char *error = "bah non mon reuf\n";
//
// 		write(-1, error, ft_strlen(error));
// 		perror("File Error :");
// 		errno = 0;
// 		write(1, str, ft_strlen(str));
// 		perror("Success :");
// 		errno = 0;
// 		write(fd, str, ft_strlen(str));
// 		perror("Success :");
// 		close(fd);
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< ft_write >>>>>>>>>>\n" RESET);
// 	{
// 		int fd = open("ft_test.txt", O_WRONLY);
//
// 		char *str = "coucou je suis le ft\n";
// 		char *error = "bah non mon reuf\n";
//
// 		write(-1, error, ft_strlen(error));
// 		perror("File Error :");
// 		errno = 0;
// 		write(1, str, ft_strlen(str));
// 		perror("Success :");
// 		errno = 0;
// 		write(fd, str, ft_strlen(str));
// 		perror("Success :");
// 		errno = 0;
// 		close(fd);
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< read >>>>>>>>>>\n" RESET);
// 	{
// 		int fd = open("test.txt", O_RDONLY);
// 		const int size = 30;
// 		char *str = calloc(size, 1);
//
// 		read(-1, str, size - 1);
// 		perror("Fail :");
// 		errno = 0;
// 		read(fd, str, size - 1);
// 		perror("Success :");
// 		printf("%s", str);
// 		free(str);
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< ft_read >>>>>>>>>>\n" RESET);
// 	{
// 		int fd = open("ft_test.txt", O_RDONLY);
// 		const int size = 30;
// 		char *str = calloc(size, 1);
//
// 		read(-1, str, size - 1);
// 		perror("Fail :");
// 		errno = 0;
// 		read(fd, str, size - 1);
// 		perror("Success :");
// 		printf("%s", str);
// 		free(str);
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< strdup >>>>>>>>>>\n" RESET);
// 	{
// 		// char *str = NULL;
// 		char *str = "coucou";
// 		char *dup = strdup(str);
// 		
// 		printf("%s\n", dup);
// 		free(dup);
// 	}
//
// 	printf(BLUE"\n <<<<<<<<<< ft_strdup >>>>>>>>>>\n" RESET);
// 	{
// 		// char *str = NULL;
// 		char *str = "coucou";
// 		char *dup = ft_strdup(str);
// 		
// 		printf("%s\n", dup);
// 		free(dup);
// 	}
// }

int main(void)
{
	// first bonus
	// printf("number :  %lu\n", ft_atoi_base("1000", "01"));
	// printf("number :  %lu\n", ft_atoi_base("100a", "01"));
	// printf("number :  %lu\n", ft_atoi_base("1000", "011"));
	// printf("number :  %lu\n", ft_atoi_base("1111", "0"));
	// printf("number :  %lu\n", ft_atoi_base("1000", ""));
	// printf("number :  %lu\n", ft_atoi_base("1000", NULL));
	// printf("number :  %lu\n", ft_atoi_base(NULL, "01"));
	// printf("number :  %lu\n", ft_atoi_base(" \n\r\t1000", "01"));
	// printf("number :  %lu\n", ft_atoi_base("11", "0123456789ABCDEF"));

	// second bonus
	t_list *lst = ft_lst_create(ft_strdup("coucou"));
	t_list *tmp = lst;
	t_list *to_free;
	char buff[100];

	for (int i = 0; i< 10; i++)
	{
		if (i == 0)
			sprintf(buff, "coucou%d", 1);
		else
			sprintf(buff, "coucou%d", 2);
		ft_list_push_front(&lst, ft_strdup(buff));
	}
	tmp = lst;
	printf("size : %d\n", ft_list_size(lst));

	ft_list_sort(&lst, ft_strcmp);
	ft_list_remove_if(&lst, "coucou1", ft_strcmp, free);

	while (tmp)
	{
		printf("lst : %s\n", (char *)tmp->data);
		to_free = tmp;
		tmp = tmp->next;
		free(to_free->data);
		free(to_free);
	}
}

// int main()
// {
// 	char *str = ft_strdup("coucou");
// 	free(str);
// }
