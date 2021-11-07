FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL authors="Stürmer, Benjamin"
MAINTAINER Stürmer, Benjamin <webmaster@stuermer-benjamin.de>

# update, install packages and clear apt cache to reduce image size
RUN apt-get update && apt-get -qq install -y --no-install-recommends \
	autoconf automake autopoint \
    build-essential bzip2 \
    curl \
    dnsutils \
    gcc git gettext groff \
    help2man \
	lib32stdc++6 lib32z1 lib32z1-dev libc6-dev libtool libgmp-dev libmpc-dev libmpfr-dev libxslt-dev libxml2-dev \
	m4 make \
    ncurses-dev \
    ocaml openssh-client openjdk-8-jdk \
	pkg-config \
    rsync \
	software-properties-common \
    tar texinfo texi2html \
    unzip \
    wget \
    zip zlib1g-dev && rm -rf /var/lib/apt/lists/*

# download and install sdkmanager
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O commandlinetools-linux-latest.zip
RUN mkdir -p /opt/android-sdk/cmdline-tools/ && unzip -q commandlinetools-linux-latest.zip -d /opt/android-sdk/cmdline-tools/ && mv /opt/android-sdk/cmdline-tools/cmdline-tools/ /opt/android-sdk/cmdline-tools/latest/

# accept licenses
RUN yes | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses

# create an empty repositories config
RUN mkdir -p /opt/android-sdk/.android && touch /opt/android-sdk/.android/repositories.cfg

# set path
ENV ANDROID_SDK_HOME /opt/android-sdk
ENV PATH=${PATH}:$ANDROID_SDK_HOME/tools/bin
ENV PATH=${PATH}:$ANDROID_SDK_HOME/cmdline-tools/latest/bin/

# sdkmanager
RUN sdkmanager --update

# build-tools
RUN sdkmanager "build-tools;31.0.0"

# cmake & ndk
RUN sdkmanager "cmake;3.10.2.4988404" "ndk-bundle"

# platform & tools
RUN sdkmanager "platform-tools" "platforms;android-31" "tools"

ENV ANDROID_NDK_HOME=/opt/android-sdk/ndk-bundle
ENV TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64
ENV SYSROOT=$TOOLCHAIN/sysroot
