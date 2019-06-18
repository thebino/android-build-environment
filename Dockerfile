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
RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O sdk-tools-linux.zip
RUN unzip -q sdk-tools-linux.zip -d tools
RUN rm sdk-tools-linux.zip
RUN mv tools /usr/local/android-sdk/

# create an empty repositories config
RUN mkdir -p /usr/local/android-sdk/.android
RUN touch /usr/local/android-sdk/.android/repositories.cfg

# set path
ENV ANDROID_HOME /usr/local/android-sdk
ENV ANDROID_SDK_HOME $ANDROID_HOME

ENV PATH=${PATH}:$ANDROID_HOME/tools/bin


RUN mkdir "${ANDROID_HOME}/licenses" || true
RUN echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > "${ANDROID_HOME}/licenses/android-sdk-license"
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "${ANDROID_HOME}/licenses/android-sdk-license"
RUN echo "84831b9409646a918e30573bab4c9c91346d8abd" > "${ANDROID_HOME}/licenses/android-sdk-preview-license"


RUN sdkmanager --update

# build-tools
RUN sdkmanager "build-tools;28.0.0"
RUN sdkmanager "build-tools;28.0.1"
RUN sdkmanager "build-tools;28.0.2"
RUN sdkmanager "build-tools;28.0.3"
RUN sdkmanager "build-tools;29.0.0"

# cmake
RUN sdkmanager "cmake;3.6.4111459"
RUN sdkmanager "cmake;3.10.2.4988404"

# lldb
RUN sdkmanager "lldb;2.0"
RUN sdkmanager "lldb;2.1"
RUN sdkmanager "lldb;2.2"
RUN sdkmanager "lldb;2.3"
RUN sdkmanager "lldb;3.0"
RUN sdkmanager "lldb;3.1"

# ndk
RUN sdkmanager "ndk-bundle"
RUN sdkmanager "ndk;20.0.5594570"

# platform
RUN sdkmanager "platform-tools"
RUN sdkmanager "platforms;android-28"
RUN sdkmanager "platforms;android-29"

# tools
RUN sdkmanager "tools"

ENV ANDROID_NDK_HOME /usr/local/android-sdk/ndk-bundle
