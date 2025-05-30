# A simple Nginx proxy for PHP-FPM

This image is based on the latest Nginx docker image and includes additional functionality so that it can easily be set
up as a PHP-FPM proxy for a container within the same Docker stack.

## Environment variables

| Name           | Description                                                 | Default      |
|----------------|-------------------------------------------------------------|--------------|
| LISTEN_PORT    | The port Nginx will listen on                               | 80           |
| DOCUMENT_ROOT  | The path to the root of the application                     | /var/www/app |
| CONTAINER_NAME | The name of the container that runs the PHP-FPM application | php-fpm      |
| CONTAINER_PORT | The port on which the PHP-FPM is exposed                    | 9000         |

Docker image can be found [here](https://hub.docker.com/repository/docker/hercdottech/docker-nginx-fpm-proxy/general)

## Static files

If your application has to serve static files this can be achieved following the example illustrated in the `docker-compose.yml` below:

```
services:
  webserver:
    image: hercdottech/docker-nginx-fpm-proxy:latest
    environment:
      LISTEN_PORT: 80
      DOCUMENT_ROOT: /var/www/app
      CONTAINER_NAME: php-fpm
      CONTAINER_PORT: 9000
    ports:
      - '8080:80'
    volumes:
      - app-files:/var/www

  php-fpm:
    image: php:8.4-fpm-alpine
    volumes:
      - app-files:/var/www

volumes:
  app-files:
```

If you mount an empty volume into a directory in the container in which files or directories exist, these files or
directories are propagated (copied) into the volume. Similarly, if you start a container and specify a volume which does
not already exist, an empty volume is created for you. This is a good way to pre-populate data that another container
needs.