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
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

NOTE: read below the _build executors_ part for the role of the `50000` port mapping.

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration.
You will probably want to make that an explicit volume so you can manage it and attach to another container for upgrades :


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

To install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

get license hash from $ANDROID_HOME/licenses/*

build the image
```sh
docker build -t android-build-environment:0.0.5 .
```



tag the version
```
docker tag android-build-environment:0.0.5 thebino/android-build-environment:0.0.5
```

login to docker
```
docker login
```

push image to docker
```
docker push thebino/android-build-environment:0.0.5
```

tag latest to last version
```
docker tag android-build-environment:0.0.5 thebino/android-build-environment:latest
```

push lates to docker hub
```
docker push thebino/android-build-environment:latest
```
run the image localy for tests  (mount /chessolution into /root)
```
docker run -t -i android-build-environment:0.0.5
docker run -t -i -v /Users/bino/workspace/android/chessolution/:/root/ android-build-environment:0.0.5
```