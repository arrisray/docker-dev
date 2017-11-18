FROM debian:jessie-slim

ARG VIM_VERSION=vim74

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
    && rm -rf /var/lib/apt/lists/* \
    && curl -fLo /usr/share/vim/${VIM_VERSION}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .vimrc /usr/share/vim/vimrc

CMD bash
