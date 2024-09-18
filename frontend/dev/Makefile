NAME := frontend-standalone

build:
	docker buildx build -t $(NAME) .

run: build
	docker run --name $(NAME) -v ./svelte:/app -it $(NAME)

stop:
	docker stop $(NAME)

clean: stop
	docker rm $(NAME)

re: clean run

fclean: clean
	docker image rm $(NAME)

.PHONY: build run stop clean re fclean