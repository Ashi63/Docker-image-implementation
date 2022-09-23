# app/Dockerfile

FROM python:3.10.5-slim

EXPOSE 8501

WORKDIR /DOCKER_IMAGE_IMPLEMENTATION

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Ashi63/docker-image-implementation.git .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]