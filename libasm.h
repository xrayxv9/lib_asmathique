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

ssize_t	ft_strlen(char *);
char	*ft_strcpy(char *, char *);
int		ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);
