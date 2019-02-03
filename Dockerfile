FROM perl:5.28.1-slim-threaded

RUN cpanm Carton &&\
    cpanm Mojolicious@8.12

WORKDIR /app
