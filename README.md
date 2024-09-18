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
│   │   └── Makefile
│   ├── backend-config.yaml     #
│   ├── backend-secret.yaml     # k8s deployment files
│   ├── backend.yaml            #
│   └── Dockerfile              # docker image for deployment
├── database
│   ├── dev
│   │   ├── postgresql          # database content
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   └── Makefile
│   ├── database-config.yaml    #
│   ├── database-secret.yaml    # k8s deployment files
│   ├── database.yaml           #
│   └── Dockerfile              # docker image for deployment
├── frontend
│   ├── dev
│   │   ├── svelte              # svelte app
│   │   │   └── [...]
│   │   ├── Dockerfile          # docker image for development
│   │   └── Makefile
│   ├── frontend-config.yaml    #
│   ├── frontend-secret.yaml    # k8s deployment files
│   └── frontend.yaml           #
│   ├── Dockerfile              # docker image for deployment
├── Makefile
└── README.md
```
