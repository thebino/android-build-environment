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
RUN mkdir -p /usr/local/android-sdk/.android
RUN touch /usr/local/android-sdk/.android/repositories.cfg

# set path
ENV ANDROID_HOME /usr/local/android-sdk
ENV ANDROID_SDK_HOME $ANDROID_HOME

ENV PATH=${PATH}:$ANDROID_HOME/tools/bin


RUN mkdir "${ANDROID_HOME}/licenses" || true
RUN echo "601085b94cd77f0b54ff86406957099ebe79c4d6" > "${ANDROID_HOME}/licenses/android-googletv-license"
RUN echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > "${ANDROID_HOME}/licenses/android-sdk-license"
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "${ANDROID_HOME}/licenses/android-sdk-license"
RUN echo "84831b9409646a918e30573bab4c9c91346d8abd" > "${ANDROID_HOME}/licenses/android-sdk-preview-license"
RUN echo "33b6a2b64607f11b759f320ef9dff4ae5c47d97a" > "${ANDROID_HOME}/licenses/google-gdk-license"
RUN echo "d975f751698a77b662f1254ddbeed3901e976f5a" > "${ANDROID_HOME}/licenses/intel-android-extra-license"
RUN echo "e9acab5b5fbb560a72cfaecce8946896ff6aab9d" > "${ANDROID_HOME}/licenses/mips-android-sysimage-license"


RUN sdkmanager --update

RUN sdkmanager "ndk-bundle"
RUN sdkmanager "cmake;3.6.4111459"
RUN sdkmanager "lldb;2.3"
RUN sdkmanager "tools"
RUN sdkmanager "platform-tools"

RUN sdkmanager "platforms;android-27"
RUN sdkmanager "platforms;android-28"

ENV ANDROID_NDK_HOME /usr/local/android-sdk/ndk-bundle


RUN sdkmanager "build-tools;27.0.1"
RUN sdkmanager "build-tools;27.0.2"
RUN sdkmanager "build-tools;27.0.3"
RUN sdkmanager "build-tools;28.0.2"
RUN sdkmanager "build-tools;28.0.3"
RUN sdkmanager "build-tools;29.0.0-rc1"

