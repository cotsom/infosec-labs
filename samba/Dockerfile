# syntax=docker/dockerfile:1

FROM dperson/samba:latest
COPY ./smb.conf /etc/samba/smb.conf
COPY entrypoint.sh .
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/sbin/tini", "--", "/usr/bin/samba.sh" ]