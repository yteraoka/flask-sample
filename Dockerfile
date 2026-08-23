FROM python:3
COPY --from=ghcr.io/astral-sh/uv:0.12.5 /uv /bin/uv
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*
RUN groupadd app && useradd -g app app
RUN mkdir /app && chown app:app /app
COPY app/* /app/
WORKDIR /app
RUN uv pip install --system --no-cache -r requirements.txt
ENV FLASK_APP=app.py
USER app
CMD ["flask", "run", "--host=0.0.0.0"]
