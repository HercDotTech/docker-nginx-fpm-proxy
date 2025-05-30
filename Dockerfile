# Initialize container image
FROM nginx:alpine
LABEL maintainer="<HercDotTech> office@herc.tech"

# Copy nginx config
COPY nginx.template /etc/nginx/

# Copy entrypoint
COPY ./entrypoint.sh /

# Set entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]