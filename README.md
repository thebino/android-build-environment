## Android build environment with NDK
[![CMAKE](https://img.shields.io/badge/cmake-3.10.2-success.svg)]()
[![NDK](https://img.shields.io/badge/ndk-r20-blue.svg)]()
[![Build Tools](https://img.shields.io/badge/buildtools-29.0.0-green.svg)]()

This Android build environment with ndk toolchain for cross compiling.


### Contains
:white_check_mark: build-tools 28.0.0, 28.0.1, 28.0.2, 28.0.3, 29.0.0, 29.0.1, 29.0.2, 29.0.3, 30.0.0, 30.0.1, 30.0.2, 30.0.3, 31.0.0,  
:white_check_mark: cmake 3.6.4111459, 3.18.1, 3.10.2.4988404
:white_check_mark: ndk-bundle and ndk 22.1.7171670
:white_check_mark: platforms android-28, android-29, android-30

## Usage example
```
docker run --rm -it -v ${PWD}:/root thebino/android-build-environment /bin/bash -c "cd && ~/gradlew :app:assemble"
```

## Meta

Benjamin Stürmer – [@benjaminstrmer](https://twitter.com/benjaminstrmer) – webmaster@stuermer-benjamin.de

Distributed under the Attribution 4.0 International (CC BY 4.0) license. See ``LICENSE`` for more information.

## Contributing

1. Fork it (<https://github.com/thebino/android-build-environment/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
