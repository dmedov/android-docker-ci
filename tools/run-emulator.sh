#!/bin/bash

set +e +x

echo "starting emulator..."
echo "no" | emulator64-arm -avd test -no-audio -no-window &

echo "waiting boot of emulator..."
android-wait-for-emulator.sh
sleep 5

adb shell input keyevent 82
adb install /opt/tools/test-butler-app-1.1.0.apk


