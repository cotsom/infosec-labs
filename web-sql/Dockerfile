FROM python:3.9-alpine
WORKDIR /code
RUN addgroup -g 2000 user && adduser -u 2000 -G user -s /bin/sh -D user

COPY requirements.txt .
RUN apk add --no-cache --virtual .build-deps mariadb-dev build-base \
    && pip install -r requirements.txt \
    && apk del .build-deps
COPY . .
EXPOSE 5000

USER user
CMD ["python3", "-u", "app.py"]
