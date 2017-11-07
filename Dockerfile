FROM debian:jessie-slim

# ARG USER=developer
# ARG GROUP=dev
# ARG UID=1000
# ARG GID=1000

# ENV USER=${USER}
# ENV GROUP=${GROUP}
# ENV UID=${UID}
# ENV GID=${GID}

# See: https://www.dajobe.org/blog/2015/04/18/making-debian-docker-images-smaller/
ARG BUILD_PACKAGES='apt-utils apt-transport-https \
    git make \
    vim wget curl unzip \
    software-properties-common'

RUN apt-get update \
    && apt-get install -yq \
        ${BUILD_PACKAGES} \
    && rm -rf /var/lib/apt/lists/*

# RUN useradd -m ${USER} \
#     && echo "${USER}:${GROUP}" | chpasswd && adduser ${USER} sudo \
#     && echo "${USER} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USER} \
#     && chmod 0440 /etc/sudoers.d/${USER}

# USER ${USER}
# ENV HOME /home/${USER}
# WORKDIR ${HOME}
