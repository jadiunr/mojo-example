FROM perl:5.28.1-threaded

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app

RUN cpanm Carton

ARG uid=1000
ARG gid=1000
RUN useradd app -s /bin/bash -m -u $uid && \
    groupmod -g $gid app && \
    chown -R app:app /app
USER app

COPY cpanfile /app/cpanfile
COPY cpanfile.snapshot /app/cpanfile.snapshot
RUN carton install

COPY . /app

CMD [ "carton", "exec", "morbo", "./script/mojo_example" ]
