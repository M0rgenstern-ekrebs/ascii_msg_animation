NAME		= ascii_gradient_animation
ARCHIVES	= 
CC			= cc
CFLAGS		= -Wall -Wextra -I includes

BRED	:=	\033[1;31m
YELLOW	:=	\033[33m
GREEN	:=	\033[32m
BLUE	:=	\033[34m
RESET	:=	\033[0m

#print_msg_color(msg, color)
define print_info_color
	@echo "$(BLUE)$(NAME): $(2)$(1) $(RESET)"
endef

#print_error(msg)
define print_error
	@echo "$(BLUE)$(NAME): $(RED)$(1) $(RESET)"
endef

#print_msg(msg)
define print_msg
	@echo "$(1)"
endef

$(NAME) : $(OBJS)
	$(call info_msg_color, "linking $(NAME)", $(BLUE))
	$(call print_msg, "$(CC) $(CFLAGS) $(OBJS) $(LIBS) $(ARCHIVES) -o $(NAME)")
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) $(ARCHIVES) -o $(NAME)

clear:
	clear

clean:
	$(call info_msg_color, "Cleaning object files", $(BLUE))
	rm -rf $(OBJS)
	make -C $(LIBFT_DIR) clean

fclean: clean
	$(call info_msg_color, "Cleaning $(NAME)", $(BLUE))
	rm -rf $(NAME)
	make -C $(LIBFT_DIR) fclean

re: clear fclean all

.PHONY: clear clean fclean re
.SILENT: $(NAME) clean clear fclean