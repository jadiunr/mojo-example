FROM perl:5.28.1-slim-threaded

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN cpanm Carton

ARG uid=1000

RUN useradd app -s /bin/bash -m -u $uid

USER app

WORKDIR /app