#include <stdio.h>
#define TRUE 1
#define FALSE 0
int ft_strlen(char *str)
{
	int i = 0;

	while (str[i++]);
	return i;
}

int parsing_base(char *base)
{
	int i = 0;
	int j = i + 1;

	if (!base || !base[0] || !base[1])
		return -1;
	while (base[i])
	{
		j = i + 1;
		if (base[i] == '+' || base[j] == '-')
			return -3;
		while(base[j])
			if (base[j++] == base[i])
				return -2;
		i++;
	}
	return FALSE;
}

int charInBase(char *base, char c)
{
	int i = 0;

	while(*base)
	{
		if (*base == c)
		{
			base = base - i;
			return TRUE;
		}
		base++;
		i++;
	}
	base = base - i;
	return FALSE;
	
}

int atoi_base(char *str, char *base)
{
	int res = parsing_base(base);
	if (res)
		return res; 
	int len = ft_strlen(base);
	int i = 0;
	int sign = 1;
	int nbr = 0;

	if (!str)
		return 0;
	while(str[i] && (str[i] >= '\a' && str[i] <= '\r'))
		i++;
	if (str[i] && (str[i] == '-' || str[i] == '+'))
		if (str[i++] == '-')
			sign = -1;
	while (str[i] && charInBase(base, str[i])){
		printf("coucou\n");
		nbr = len * nbr + ();
		i++;
	}
	return nbr * sign;
}


int main()
{
	printf("%d\n", atoi_base("10", "10"));
}
