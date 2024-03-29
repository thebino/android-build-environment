## Android build environment with NDK
This Android build environment with ndk toolchain for cross compiling.


[![Build Tools](https://img.shields.io/badge/buildtools-31.0.0-green.svg)]()

[![CMAKE](https://img.shields.io/badge/cmake-3.18.1-success.svg)]()

[![NDK](https://img.shields.io/badge/ndk-bundle-22.1.7171670-blue.svg)]()

[![Android Image](https://img.shields.io/badge/android-31-grey.svg)]()

## Usage example
```
docker run --rm -it -v ${PWD}:/root thebino/android-build-environment /bin/bash -c "cd && ~/gradlew :app:assemble"
```

### Environment variables
| Variable         | Destination                                              |
| ---------------- |:---------------------------------------------------------|
| ANDROID_SDK_HOME | /opt/android-sdk/                                        |
| ANDROID_NDK_HOME | /opt/android-sdk/ndk-bundle                              |
| TOOLCHAIN        | $ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/ |

## Meta

Benjamin Stürmer – [@benjaminstrmer](https://twitter.com/benjaminstrmer) – webmaster@stuermer-benjamin.de

Distributed under the Attribution 4.0 International (CC BY 4.0) license. See ``LICENSE`` for more information.
