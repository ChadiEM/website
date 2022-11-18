FROM nginxinc/nginx-unprivileged:1.23-alpine

COPY website/. /usr/share/nginx/html
COPY nginx/. /etc/nginx/conf.d
