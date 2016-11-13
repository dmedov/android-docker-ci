#!/bin/bash

set +e

echo "starting emulator..."
emulator64-arm -avd test -no-audio -no-window &

echo "waiting boot of emulator..."
android-wait-for-emulator.sh

adb shell input keyevent 82
adb install test-butler-app-1.1.0.apk

