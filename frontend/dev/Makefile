MAKEFLAGS := --silent
NAME := frontend-std

build:
	echo "[MAKE] building $(NAME)" && docker buildx build -t $(NAME) . || echo "[MAKE] skip"

run: build
	echo "[MAKE] running $(NAME)" && docker run --name $(NAME) -p 7000:5173 -v ./svelte/:/app/ -it $(NAME) || echo "[MAKE] skip"

stop:
	echo "[MAKE] stopping $(NAME)" && docker stop $(NAME) 2>/dev/null || echo "[MAKE] skip"

clean: stop
	echo "[MAKE] removing $(NAME)" && docker rm $(NAME) 2>/dev/null || echo "[MAKE] skip"

re: clean run

fclean: clean
	echo "[MAKE] removing $(NAME)'s image" && docker image rm $(NAME) 2>/dev/null || echo "[MAKE] skip"

.PHONY: build run stop clean re fclean