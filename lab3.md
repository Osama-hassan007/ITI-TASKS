### LAB3
### problem (1)
``` bash
version: '3.8'
services:
  multistage:
    image: multi:v1.0
    ports:
     - "3001:80"

docker-compose up -d 
```
### problem (2)
``` bash 

FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]

sudo docker build -t py:v1.0 .

version: "3.9"
services:
  web:
    image: py:v1.0
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"

docker-compose up -d    

