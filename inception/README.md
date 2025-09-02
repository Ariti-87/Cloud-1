# 🐳 Inception

## 📝 Overview

**Inception** is a project aimed at building a small Docker-based infrastructure composed of multiple services running in separate containers.  
The goal is to learn and apply best practices in containerization with **Docker** and **docker-compose**, by deploying a secure, fully functional, and persistent WordPress website.  

Each service has its own Dockerfile, based on Alpine or Debian, and all services communicate through a shared Docker network.  

## 🛠️ Services to set up

- **NGINX** (TLSv1.2 / TLSv1.3 only, port 443 as the single entry point)  
- **WordPress + php-fpm**  
- **MariaDB** (WordPress database)  
- **2 volumes**:  
  - `wordpress_data` → persistence of WP files  
  - `mariadb_data` → persistence of the database  
- **1 Docker network** linking all services  

## 📂 Structure attendue

```sh
.
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── mariadb
        │   ├── conf
        │   │   ├── 50-server.cnf
        │   │   └── entrypoint.sh
        │   └── Dockerfile
        ├── nginx
        │   ├── conf
        │   │   └── nginx.conf
        │   └── Dockerfile
        └── wordpress
            ├── conf
            │   └── entrypoint.sh
            └── Dockerfile
```

## ⚙️ Installation & Usage

1. Configure environment variables

Edit the file srcs/.env:
```env
SQL_DATABASE=inception_db
SQL_ROOT_PASSWORD=
SQL_USER=
SQL_PASSWORD=

WP_TITLE=inception_wp
WP_ADMIN_USER=
WP_ADMIN_PASSWORD=
WP_ADMIN_EMAIL=
WP_USER_LOGIN=
WP_USER_EMAIL=
WP_USER_PASSWORD=
```

2. Docker Commands

Images & Containers
```sh
docker build            # Build a Docker image from a Dockerfile
docker run              # Run a container from an image
docker pull             # Pull an image from a registry
docker push             # Push an image to a registry
docker ps               # List running containers
docker stop             # Stop a container
docker rm               # Remove a container
docker rmi              # Remove an image
docker exec             # Execute a command inside a running container
docker logs             # View logs of a container

docker build chemin/nginx/
docker build .          # Inside nginx folder
docker build -t nginx . # Tagging image

docker run nginx
docker run -it nginx    # Run with interactive shell
    ls 
    exit
docker run -p 8080:443 nginx

docker image ls         # List images
docker rmi nginx        # Remove image by name
docker rmi -f           # Force remove

docker ps               # Running containers
docker ps -a            # All containers
docker stop <id|name>
docker kill <id|name>   # Force kill
docker container prune  # Remove stopped containers
docker system prune     # Remove all (containers/images/cache...)

docker exec -it nginx bash  # Open bash inside container
docker logs <container>     # Check logs
```

3. Docker-compose commands:

```sh
docker-compose -f <path docker_compose> -d -build
docker-compose -f <path docker_compose> stop
docker-compose -f <path docker_compose> down -v
docker-compose -f <path docker_compose> logs
```

4. MariaDB commands:

```sql

mariadb -u root -p #Start

SELECT DATABASE();
SELECT User, Host FROM mysql.user;
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'pwd';
GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost';
CREATE DATABASE database_name;
USE database_name;
SHOW DATABASES;
SELECT * FROM table_name;
DELETE FROM table_name WHERE condition;
DROP DATABASE database_name;
DROP TABLE table_name;
```

## 🎯 Expected result

At the end of the project, your domain login.42.fr must redirect to your secure WordPress site over HTTPS, with:
- persistent data (DB & WP files)
- isolated but interconnected containers
- a maintainable and reproducible infrastructure via make

