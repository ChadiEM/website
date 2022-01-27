FROM nginxinc/nginx-unprivileged:1.21-alpine

COPY website/. /usr/share/nginx/html
COPY nginx/. /etc/nginx/conf.d
