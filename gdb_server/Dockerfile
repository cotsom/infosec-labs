FROM alpine

RUN apk update && apk add gdb
COPY entrypoint.sh .
RUN /entrypoint.sh
RUN gdbserver 0.0.0.0:1337 /bin/true