#pragma once

#include <stddef.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define RED     "\033[31m"
#define GREEN   "\033[32m"
#define YELLOW  "\033[33m"
#define BLUE    "\033[34m"
#define RESET   "\033[0m"
#define TRUE 1
#define FALSE 0

// STRUCT BONUS
typedef struct s_list
{
	struct s_list	*next;
	void			*data;
}	t_list;

// MANDATORY
ssize_t	ft_strlen(char *);
char	*ft_strcpy(char *, char *);
int		ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);

// BONUS
size_t	ft_atoi_base(char *number, char *base);
t_list	*ft_lst_create(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
