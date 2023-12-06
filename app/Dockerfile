FROM python:3.10.13-alpine

WORKDIR /app

COPY requirements.txt /app
COPY app.py /app
COPY templates /app/templates

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

ENTRYPOINT ["python3"]
CMD ["app.py"]
