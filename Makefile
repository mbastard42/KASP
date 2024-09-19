up:
	docker compose up --build -d

stop:
	docker compose stop

down: stop
	docker compose down -v

re : down up

.PHONY: up stop down re