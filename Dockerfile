FROM alpine

# Partially based on https://hub.docker.com/r/pernodricard/kaniko-alpine/dockerfile
COPY --from=gcr.io/kaniko-project/executor /kaniko /kaniko

# Set env variables for kaniko
ENV HOME /root
ENV USER /root
ENV PATH $PATH:/kaniko
ENV SSL_CERT_DIR /kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json

# Setup our own stuff
RUN apk add --no-cache --upgrade bash openssl coreutils curl

# Set the default shell to bash
ENTRYPOINT ["/bin/bash"]
