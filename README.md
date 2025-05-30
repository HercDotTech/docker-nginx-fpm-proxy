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
