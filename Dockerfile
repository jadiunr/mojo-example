FROM perl:5.28.1-slim-threaded
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN cpanm Carton
RUN useradd app -s /bin/bash -m

USER app

WORKDIR /app
