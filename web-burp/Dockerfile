# syntax=docker/dockerfile:1
FROM python:3.9-alpine
WORKDIR /code
COPY . .
RUN apk update
RUN addgroup -g 2000 user \
    && adduser -u 2000 -G user -s /bin/sh -D user
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000

USER user
CMD ["python3", "-u", "app.py"]
