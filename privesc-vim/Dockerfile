FROM python:3.9-alpine as build
WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apk add vim sudo --no-cache

COPY . .

RUN addgroup -g 2000 user && adduser -u 2000 -G user -s /bin/sh -D user
RUN echo "user ALL=(root) NOPASSWD: /usr/bin/vim" > /etc/sudoers.d/user

USER user
EXPOSE 5000
CMD ["python3", "-u", "app.py"]
