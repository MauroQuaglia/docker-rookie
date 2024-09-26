FROM postgres:16.4

# docker cp my-pg-container:/usr/share/postgresql/postgresql.conf.sample .
COPY my_postgresql.conf /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]