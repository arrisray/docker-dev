FROM debian:jessie-slim

# Args
ARG BUILD_PACKAGES='apt-utils apt-transport-https \
    sudo git make \
    vim wget curl unzip \
    gcc \
    strace \
    supervisor'

# Install packages
# See: https://www.dajobe.org/blog/2015/04/18/making-debian-docker-images-smaller/
RUN apt-get update \
    && apt-get install -yq \
        ${BUILD_PACKAGES} \
    && rm -rf /var/lib/apt/lists/*

CMD bash
