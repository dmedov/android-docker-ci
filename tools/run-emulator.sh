#!/bin/bash

set +e

echo "starting emulator..."
emulator64-arm -avd test -no-audio -no-window &

echo "waiting boot of emulator..."
android-wait-for-emulator.sh



