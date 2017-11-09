FROM ubuntu:17.10

MAINTAINER Benjamin Stürmer <webmaster@stuermer-benjamin.de>

RUN apt-get -qq update
RUN apt-get -qq install -y wget unzip git \
	autoconf build-essential bzip2 curl gcc groff \
	lib32stdc++6 lib32z1 lib32z1-dev \
	lib32ncurses5 libc6-dev libgmp-dev \
	libmpc-dev libmpfr-dev libxslt-dev libxml2-dev \
	m4 make ncurses-dev ocaml openssh-client \
	pkg-config python-software-properties rsync \
	software-properties-common unzip wget zip \
	zlib1g-dev openjdk-8-jdk

# download android sdk
RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O sdk-tools-linux.zip
RUN unzip -q sdk-tools-linux.zip -d tools
RUN rm sdk-tools-linux.zip
RUN mv tools /usr/local/android-sdk/

# create an empty repositories config
RUN touch /usr/local/android-sdk/.android/repositories.cfg

# set path
ENV ANDROID_HOME /usr/local/android-sdk
ENV ANDROID_SDK_HOME $ANDROID_HOME

ENV PATH=${PATH}:$ANDROID_HOME/tools/bin

RUN sdkmanager --update

RUN sdkmanager "ndk-bundle"
ENV ANDROID_NDK_HOME /usr/local/android-sdk/ndk-bundle

RUN sdkmanager "cmake;3.6.4111459"
RUN sdkmanager "lldb;2.3"
