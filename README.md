# android-docker-ci

based on this repo https://github.com/appunite/docker

# how to

1) first we need to build image
docker build -t dmedov/android .

2) to run junit tests, run this command from your current source folder:
docker run --tty --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm dmedov/android  /bin/sh -c "./gradlew test"

to run integrations test on emulator, run this command from your current source folder:
docker run --tty --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm dmedov/android  /bin/sh -c "run-tests-emulator.sh"

# custom actions
to run emulator use "/tools/run-emulator.sh"
"tools" folder under $PATH veriable in docker container

# example of travis ci file
```bash
sudo: required

services:
  - docker

script: ./package.sh
```
--------------------

package.sh content:

#!/bin/bash
set -e -x

git clone https://github.com/dmedov/android-docker-ci.git
cd android-docker-ci
docker build -t dmedov/android .
cd ..
docker run --tty --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm dmedov/android  /bin/sh -c "run-tests-emulator.sh"

