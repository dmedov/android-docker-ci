#!/bin/bash

set +e

echo "starting emulator..."
emulator64-arm -avd test -no-audio -no-window &

echo "waiting boot of emulator..."
android-wait-for-emulator.sh
sleep 5
adb install /opt/tools/test-butler-app-1.1.0.apk
#adb shell input keyevent 82
