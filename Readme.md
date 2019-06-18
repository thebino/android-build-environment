## Android build environment with NDK
[![CMAKE](https://img.shields.io/badge/cmake-3.10.2-success.svg)]()
[![NDK](https://img.shields.io/badge/ndk-r20-blue.svg)]()
[![Build Tools](https://img.shields.io/badge/buildtools-29.0.0-green.svg)]()

This Android build environment with ndk toolchain for cross compiling.


### Contains
:white_check_mark: build-tools 28.0.0, 28.0.1, 28.0.2, 28.0.3, 29.0.0  
:white_check_mark: cmake 3.6.4111459, 3.10.2.4988404  
:white_check_mark: lldb 2.0, 2.1, 2.2, 2.3, 3.0, 3.1  
:white_check_mark: ndk-bundle and ndk 20.0.5594570  
:white_check_mark: platforms android-28, android-29  

## Usage example

```
docker run --rm -v ${PWD}:/root thebino/android-build-environment /bin/bash -c "cd && ~/gradlew :app:assemble"
```

## Release History
* 0.0.6
	* ADD: android-29 image
	* ADD: android-Q image
	* ADD: build-tools 28.0.1, 29.0.0
	* CHANGE: Update ndk-bundle to 20.0.5594570
	* CHANGE: Update platform-tools to 29.0.1
* 0.0.5   
	* ADD: android-28 image
    * ADD: build-tools 28.0.2, 28.0.3, 29.0.0-rc1
    * CHANGE: Update docs (module code remains unchanged)
* 0.0.4
    * ADD: build-tools 27.0.3
* 0.0.3
    * ADD: build-tools 26.0.1, 26.0.2, 26.0.3
    * ADD: build-tools 27.0.0, 27.0.1, 27.0.2
* 0.0.2
    * ADD: android-26 image
    * ADD: android-27 image
* 0.0.1
    * First draft
    * ADD: cmake 3.6.4111459
    * ADD: lldb 2.3

## Meta

Benjamin Stürmer – [@benjaminstrmer](https://twitter.com/benjaminstrmer) – webmaster@stuermer-benjamin.de

Distributed under the Attribution 4.0 International (CC BY 4.0) license. See ``LICENSE`` for more information.

## Contributing

1. Fork it (<https://github.com/thebino/android-build-environment/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## Development setup

To install development dependencies, use sdkmanager inside the docker image. Grep license hashes from your `$ANDROID_HOME/licenses` and update Dockerfile

build the image
```sh
docker build -t android-build-environment:0.0.6 .
```

tag the version
```
docker tag android-build-environment:0.0.6 thebino/android-build-environment:0.0.6
```

push image to docker (login needed)
```
docker push thebino/android-build-environment:0.0.6
```

tag latest to last version
```
docker tag android-build-environment:0.0.6 thebino/android-build-environment:latest
```

push lates to docker hub
```
docker push thebino/android-build-environment:latest
```
