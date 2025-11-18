#include "../libasm.h"

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
			if (base[j] == base[i])
				return -2;
		i++;
	}
	return 0;
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
	if (base)
		return res; 
	int len = ft_strlen(base);
	int i = 0;
	int sign = 1;

	if (!str)
		return 0;
	while(str[i] && (str[i] >= '\a' && str[i] <= '\r'))
		i++;
	if (str[i] && (str[i] == '-' || str[i] == '+'))
		if (str[i++] == '-')
			sign = -1;
	while (str[i] && charInBase(base, str[i])){
		
	}
	return 0;
}


int main()
{


}
