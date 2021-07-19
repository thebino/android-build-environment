FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL authors="Stürmer, Benjamin"
MAINTAINER Stürmer, Benjamin <webmaster@stuermer-benjamin.de>

RUN apt-get -qq update
RUN apt-get -qq install -y wget unzip git \
	autoconf automake \
    build-essential bzip2 \
    curl \
    dnsutils \
    gcc groff \
    help2man \
	lib32stdc++6 lib32z1 lib32z1-dev libc6-dev libtool libgmp-dev libmpc-dev libmpfr-dev libxslt-dev libxml2-dev \
	m4 make \
    ncurses-dev \
    ocaml openssh-client openjdk-8-jdk \
	pkg-config \
    rsync \
	software-properties-common \
    texinfo texi2html \
    unzip \
    wget \
    zip zlib1g-dev

# download and install sdkmanager
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip -O commandlinetools-linux-latest.zip
RUN mkdir -p /opt/android-sdk/cmdline-tools/
RUN unzip -q commandlinetools-linux-latest.zip
RUN mv cmdline-tools /opt/android-sdk/cmdline-tools/latest
RUN rm commandlinetools-linux-latest.zip

# accept licenses
RUN yes | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses

# create an empty repositories config
RUN mkdir -p /opt/android-sdk/.android
RUN touch /opt/android-sdk/.android/repositories.cfg

# set path
ENV ANDROID_SDK_HOME /opt/android-sdk/
ENV PATH=${PATH}:$ANDROID_SDK_HOME/tools/bin
ENV PATH=${PATH}:$ANDROID_SDK_HOME/cmdline-tools/latest/bin/

# sdkmanager
RUN sdkmanager --update

# build-tools
RUN sdkmanager "build-tools;31.0.0"

# cmake
RUN sdkmanager "cmake;3.18.1"
RUN sdkmanager "cmake;3.10.2.4988404"
RUN sdkmanager "cmake;3.6.4111459"

# ndk
RUN sdkmanager "ndk-bundle"
RUN sdkmanager "ndk;22.1.7171670"

# platform
RUN sdkmanager "platform-tools"
RUN sdkmanager "platforms;android-31"

# tools
RUN sdkmanager "tools"

ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle
