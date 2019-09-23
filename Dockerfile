FROM python:3.7-alpine
LABEL maintainer="pex"
LABEL description="Tennis-bot Robot Framework Docker."

COPY pip_requirements.txt /tmp/pip_requirements.txt
RUN pip install -r /tmp/pip_requirements.txt
