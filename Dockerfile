FROM debian:11.1

# Set up working locales and upgrade the base image
ENV LANG="C.UTF-8"

ARG DEBIAN_MIRROR

RUN { [ ! "$DEBIAN_MIRROR" ] || sed -i "s|http://\(\w*\.\)*deb\.debian\.org/debian/\? |$DEBIAN_MIRROR |" /etc/apt/sources.list; } && \
    apt-get -q update && \
    apt-get -q dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -q install --no-install-recommends -y m4 make patch bison flex bzip2 xz-utils curl gcc-12 clang zlib1g-dev gnat-12 build-essential git libncurses5-dev \
    && apt-get clean
