# build the image
docker build -t android-build-environment:0.0.4 .

# tag the version
docker tag android-build-environment:0.0.4 thebino/android-build-environment:0.0.4

# login to docker
docker login

# push image to docker
docker push thebino/android-build-environment:0.0.4

# tag latest to last version
docker tag android-build-environment:0.0.4 thebino/android-build-environment:latest

# push lates to docker hub
docker push thebino/android-build-environment:latest


# run the image localy for tests  (mount /chessolution into /root)
docker run -t -i android-build-environment:0.0.4
docker run -t -i -v /Users/bino/workspace/android/chessolution/:/root/ android-build-environment:0.0.4