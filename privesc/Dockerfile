FROM alpine:3 as build
COPY myTasks.c .
RUN apk update
RUN apk add --no-cache gcc musl-dev linux-headers
RUN gcc myTasks.c -o /opt/systemChecker

FROM lscr.io/linuxserver/openssh-server:latest
COPY --from=build /opt/systemChecker /opt/systemChecker
RUN chmod u+s /opt/systemChecker
RUN chmod g+s /opt/systemChecker

