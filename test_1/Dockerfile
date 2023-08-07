# FROM scratch
FROM nginx:latest

HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost:80 || exit 1