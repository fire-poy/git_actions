# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpons <mpons@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/23 17:30:16 by mpons             #+#    #+#              #
#    Updated: 2022/09/01 19:35:51 by mpons            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= push_swap

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
DEBUG_CFLAGS = -g3 -fsanitize=address -fno-omit-frame-pointer

OBJS		= ${SRC:.c=.o}

RM			= rm -f

LIBFT_DIR	= ./libft

SRC 		= ./src/main.c\
			  ./src/outils.c\
			  ./src/node.c\
			  ./src/replace.c\
			  ./operation/operation.c\
			  ./operation/push.c\
			  ./operation/swap.c\
			  ./operation/rotate.c\
			  ./algos/sort_3_5.c\
			  ./algos/find_min_max.c\
			  ./algos/find_pivot_and_next.c\
			  ./algos/info_stk.c\
			  ./algos/choix.c\
			  ./algos/push_swap.c\
			  
INC			= -I./inc 

LIB			= ./libft/libft.a 

all: $(NAME)

$(NAME):	$(OBJS)
			$(MAKE) -C $(LIBFT_DIR)
			$(CC) -o $(NAME) $(SRC) $(LIB) $(DEBUG_CFLAGS)

debug: fclean
debug: CFLAGS += $(DEBUG_CFLAGS)
debug: MLX_FLAGS += $(DEBUG_CFLAGS)
debug: $(NAME)

norm:
	./norminette -d ./src ./operation ./algos

clean:
			$(MAKE) -C $(LIBFT_DIR) clean
		   	$(RM) $(OBJS)

fclean: 
			$(MAKE) -C $(LIBFT_DIR) fclean
		   	$(RM) $(OBJS)
	   		$(RM) $(NAME)

re:			fclean all

.PHONY : all clean fclean re bonus
