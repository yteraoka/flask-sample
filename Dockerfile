FROM python:3
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir /app
COPY app/* /app/
RUN cd /app && pip install -r requirements.txt
WORKDIR /app
ENV FLASK_APP=app.py
CMD flask run --host=0.0.0.0
