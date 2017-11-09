# build the image
docker build -t android-build-environment:0.0.1 .

# run the image localy for tests
docker run -it android-build-environment:0.0.1

# tag the version
docker tag android-build-environment:0.0.1 thebino/android-build-environment:0.0.1

# login to docker
docker login

# push image to docker
docker push thebino/android-build-environment:0.0.1
