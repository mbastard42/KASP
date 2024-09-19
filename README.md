# KSSP | Kubernetes Svelte Symphony PostgreSQL

Accelerate your web development with this ready-to-use development environment.
This repo offers a streamlined setup for Kubernetes with 3 components; Symfony, Svelte, and PostgreSQL, along with a CI/CD pipeline to ensure efficient development and deployment.

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
│   ├── backend.yaml            # | k8s
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

`.env` files in the `dev/` directory define variables **for development purposes only**. They should use the same labels as `{component}-secret.yaml` files but with simple values. These files can be safely pushed to the repository.

`data:` labels in `{component}-secret.yaml` files should remain empty. These variables can be added using GitHub Actions, providing environment variables without appearing in the repository.

## Makefiles

### ./*/dev/Makefiles

`Makefiles` in the `dev/` directory provide rules for managing Docker containers to **develop components as standalone entities**. A volume is used to synchronize changes between the host and the container. **This Makefiles must be executed from within the `dev/` directory** to ensure correct volume mounting.

```Makefile
NAME := {frontend|backend|database}-standalone

build:
	docker buildx build -t $(NAME) .

run: build
	docker run --name $(NAME) -v ./{svelte|symfony}:/app -p port:port -it $(NAME) # no volume for postgresql to avoid chown conflicts

stop:
	docker stop $(NAME)

clean: stop
	docker rm $(NAME)

re: clean run

fclean: clean
	docker image rm $(NAME)

.PHONY: build run stop clean re fclean
```

### ./*/Makefiles

### ./Makefile

