FROM python:3.9-alpine
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

RUN addgroup -g 2000 user && adduser -u 2000 -G user -s /bin/sh -D user
USER user

EXPOSE 5000

CMD ["python3", "-u", "app.py"]
