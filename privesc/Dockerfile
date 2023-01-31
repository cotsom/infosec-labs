# syntax=docker/dockerfile:1
FROM lscr.io/linuxserver/openssh-server:latest
WORKDIR /code
COPY myTasks.c .
RUN apk update
RUN apk add --no-cache gcc musl-dev linux-headers
RUN gcc myTasks.c -o /opt/systemChecker; rm myTasks.c
RUN chmod u+s /opt/systemChecker
RUN chmod g+s /opt/systemChecker
# RUN addgroup -g 2000 user \
#     && adduser -u 2000 -G user -s /bin/sh -D user

# USER user
