FROM scratch
MAINTAINER akerl <me@lesaker.org>
ENV DUCKTAPE_VERSION 0.4.0
ENV ROOTFS_VERSION 0.0.113
ENV DUCKTAPE_URL https://github.com/dock0/arch/releases/download/$ROOTFS_VERSION/root.tar.bz2
ADD shim/shim /tmp/ducktape/shim
ADD cert /tmp/ducktape/cert
ADD https://github.com/dock0/ducktape/releases/download/$DUCKTAPE_VERSION/ducktape /tmp/ducktape/ducktape
RUN ["/tmp/ducktape/shim", ""]
RUN ["/tmp/ducktape/ducktape", ""]
RUN pacman -Syu --needed --noconfirm git iproute2 iputils procps-ng tar which licenses util-linux
CMD ["/bin/bash"]
