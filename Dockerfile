FROM python:3
RUN mkdir /app
ADD app/* /app/
RUN cd /app && pip install -r requirements.txt
WORKDIR /app
ENV FLASK_APP=app.py
CMD flask run --host=0.0.0.0
