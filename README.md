# [ KSSP ] Kubernetes Svelte Symphony PostgreSQL

Accelerate your web development with this ready-to-use development environment.
This repository offers a complete solution for Kubernetes, integrating Symfony, Svelte, and PostgreSQL. A streamlined CI/CD pipeline ensures smooth development and deployment processes."

## Project structure

```bash
.
├── backend
│   ├── dev
│   │   ├── symfony             # symfony app
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   ├── .env                # development environment variables
│   │   └── Makefile            # rules to develop the backend as a standalone component
│   ├── backend-config.yaml     # |
│   ├── backend-secret.yaml     # | k8s deployment files
│   ├── backend.yaml            # |
│   ├── Dockerfile              # docker image for deployment
│   └── Makefile                # rules to test, build and push deployment image on DockerHub
├── database
│   ├── dev
│   │   ├── server              # postgresql server config
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   ├── .env                # development environment variables
│   │   └── Makefile            # rules to develop the database as a standalone component
│   ├── database-config.yaml    # |
│   ├── database-secret.yaml    # | k8s deployment files
│   ├── database.yaml           # |
│   ├── Dockerfile              # docker image for deployment
│   └── Makefile                # rules to test, build and push deployment image on DockerHub
├── frontend
│   ├── dev
│   │   ├── svelte              # svelte app
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   ├── .env                # development environment variables
│   │   └── Makefile            # rules to develop the frontend as a standalone component
│   ├── frontend-config.yaml    # |
│   ├── frontend-secret.yaml    # | k8s deployment files
│   ├── frontend.yaml           # |
│   ├── Dockerfile              # docker image for deployment
│   └── Makefile                # rules to test, build and push deployment image on DockerHub
├── README.md
├── docker-compose.yaml         # docker cluster for development
└── Makefile                    # rules to automate the deployment process
```

## Environments & Secrets

`.env` files in the `dev/` directory define variables **for development purposes only**. They should use the same labels as `{frontend|backend|database}-secret.yaml` files but with simple values. These files can be safely pushed to the repository.

`data:` labels in `{frontend|backend|database}-secret.yaml` files should remain empty. These variables can be added using GitHub Actions, providing environment variables without appearing in the repository.

## Makefiles

### ./*/dev/Makefiles

`Makefiles` in the `dev/` directory provide rules for managing Docker containers to **develop components as standalone entities**. A volume is used to synchronize changes between the host and the container. **This Makefiles must be executed from within the `dev/` directory** to ensure correct volume mounting.

```Makefile
MAKEFLAGS := --silent
NAME := {frontend|backend|database}-standalone

build:
	echo "[MAKE] building $(NAME)" && docker buildx build -t $(NAME) . || echo "[MAKE] skip"

run: build
	echo "[MAKE] running $(NAME)" && docker run --name $(NAME) -p port:port -it $(NAME) || echo "[MAKE] skip"

stop:
	echo "[MAKE] stopping $(NAME)" && docker stop $(NAME) 2>/dev/null || echo "[MAKE] skip"

clean: stop
	echo "[MAKE] removing $(NAME)" && docker rm $(NAME) 2>/dev/null || echo "[MAKE] skip"

re: clean run

fclean: clean
	echo "[MAKE] removing $(NAME)'s image" && docker image rm $(NAME) 2>/dev/null || echo "[MAKE] skip"

.PHONY: build run stop clean re fclean
```

### ./*/Makefiles

```Makefile
```

### ./Makefile

```Makefile
```

## Development

## Deployment

## CI/CD Pipeline
