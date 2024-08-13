# Use the python:3.12-alpine3.20 image as the base image
FROM python:3.12-alpine3.20


# Install pyyaml
RUN set -eux \
    python3 -m pip install pip==24.2; \
    pip3 install --no-cache-dir pyyaml==6.0.2; \
    apk update && apk add --no-cache \
    postgresql16-client=16.3-r0 \
    curl=8.9.0-r0 git=2.45.2-r0

# Set the entrypoint to sh for running shell commands
ENTRYPOINT ["sh", "-c"]
