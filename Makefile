NAME = libftprintf.a

CC = cc
CFLAGS = -Wall -Wextra -Werror

LIBFT_PATH = includes/libft
PRINTF_PATH = src
INCLUDES_PATH = includes

LIBFT_SRCS = $(addprefix $(LIBFT_PATH)/, ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c)

PRINTF_SRCS = $(addprefix $(PRINTF_PATH)/, ft_printf.c handle_conversions.c utils.c hex_utils.c unsigned_utils.c)

SRCS = $(LIBFT_SRCS) $(PRINTF_SRCS)

OBJS = $(SRCS:.c=.o)

AR = ar -rcs

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

%.o: %.c $(INCLUDES_PATH)/ft_printf.h $(LIBFT_PATH)/libft.h Makefile
	$(CC) $(CFLAGS) -I$(INCLUDES_PATH) -I$(LIBFT_PATH) -c -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
