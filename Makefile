NAME = libasm.a

NASM = nasm

FLAGS = -f elf64 

SRC = ft_strlen.s \
	  ft_strcpy.s \
	  ft_strcmp.s \
	  # ft_write.s \
	  # ft_read.s \
	  # ft_strdup.s \

SRC_BONUS = ft_atoi_base.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_remove_if.s \


OBJ_PATH = obj/

OBJ_SRC = $(SRC:.s=.o)

OBJS_SRC = $(addprefix $(OBJ_PATH), $(OBJ_SRC))

all: $(NAME)

$(NAME): $(OBJS_SRC)
	ar -rcs $(NAME) $(OBJS_SRC)	

$(OBJ_PATH)%.o:%.s
	mkdir -p $(OBJ_PATH)
	$(NASM) $(FLAGS) -o $@ $<

clean: 
	rm -fr $(OBJ_PATH)

fclean: clean
	rm -fr $(NAME)

re : fclean all

.PHONY: all fclean clean re

