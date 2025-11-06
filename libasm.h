#pragma once

#include <stddef.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

ssize_t	ft_strlen(char *);
char	*ft_strcpy(char *, char *);
int		ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);
