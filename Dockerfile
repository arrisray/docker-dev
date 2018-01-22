FROM debian:9

ARG VIM_VERSION=vim80

# Args
ARG BUILD_PACKAGES='apt-utils apt-transport-https \
    sudo git make gnupg procps\
    vim wget curl unzip \
    gcc \
    strace \
    supervisor \
    build-essential'

# Install packages
# See: https://www.dajobe.org/blog/2015/04/18/making-debian-docker-images-smaller/
RUN apt-get update \
    && apt-get install -yq \
        ${BUILD_PACKAGES} \
    && apt-get clean \
    && curl -fLo /usr/share/vim/${VIM_VERSION}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

COPY .vimrc /usr/share/vim/vimrc

CMD bash
