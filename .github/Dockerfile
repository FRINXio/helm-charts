# Use the python:3.12-alpine3.20 image as the base image
FROM python:3.12-alpine3.20

# Ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# Install pyyaml
RUN set -eux \
    python3 -m pip install --upgrade pip \
    pip3 install pyyaml==5.4.1 --no-cache-dir

# Install postgresql-client
RUN set -eux \
    apk update && apk add postgresql16-client --no-cache 

# Set the entrypoint to sh for running shell commands
ENTRYPOINT ["sh", "-c"]
