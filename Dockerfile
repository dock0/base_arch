FROM scratch
MAINTAINER akerl <me@lesaker.org>
ENV DUCKTAPE_VERSION v0.4.13
ADD shim/shim /tmp/ducktape/shim
ADD cert /tmp/ducktape/cert
ADD https://github.com/dock0/ducktape/releases/download/$DUCKTAPE_VERSION/ducktape /tmp/ducktape/ducktape
RUN ["/tmp/ducktape/shim", ""]
RUN ["/tmp/ducktape/ducktape", "https://github.com/dock0/tarball_arch/releases/download/v2.1.5/root.tar.bz2"]
RUN ln -s /proc/mounts /etc/mtab
RUN pacman -Syy --needed --noconfirm archlinux-keyring
RUN pacman -Su --needed --noconfirm git iproute2 iputils procps-ng tar which licenses util-linux
CMD ["/bin/bash"]
