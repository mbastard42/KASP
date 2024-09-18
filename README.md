# KSSP | Kubernetes Svelte Symphony PostgreSQL

Accelerate your web development with this ready-to-use development environment.
This repo offers a streamlined setup for Kubernetes, Symfony, Svelte, and PostgreSQL, along with a CI/CD pipeline to ensure efficient development and deployment.

## Project structure

```bash
.
├── backend
│   ├── dev
│   │   ├── bin                 # symfony utils
│   │   │   ├── composer.phar
│   │   │   └── symfony
│   │   ├── symfony             # symfony app
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   ├── .env                # development environment variables
│   │   └── Makefile            # rules to develop the backend as a standalone component
│   ├── backend-config.yaml     # |
│   ├── backend-secret.yaml     # | k8s deployment files
│   ├── backend.yaml            # | k8s
│   └── Dockerfile              # docker image for deployment
├── database
│   ├── dev
│   │   ├── postgresql          # database content
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   ├── .env                # development environment variables
│   │   └── Makefile            # rules to develop the database as a standalone component
│   ├── database-config.yaml    # |
│   ├── database-secret.yaml    # | k8s deployment files
│   ├── database.yaml           # |
│   └── Dockerfile              # docker image for deployment
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
│   └── Dockerfile              # docker image for deployment
├── README.md
└── Makefile                    # rules to automate the deployment process
```

## Environments & Secrets

`.env` files in the `dev/` directory define variables for development purposes only. They should use the same labels as `{component}-secret.yaml` files but with simple values. These files can be safely pushed to the repository.

`data:` labels in `{component}-secret.yaml` files should remain empty. These variables can be added using GitHub Actions, providing environment variables without appearing in the repository.

## Development

`Makefiles `in the `dev/` directory provide rules for managing Docker containers to develop components (frontend, backend, or database) as standalone entities. A volume is used to synchronize changes between the host and the container. They must be called from inside the `dev/` directory (relative path for volume mounting).