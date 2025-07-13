#!/usr/bin/env bash

# Wait for 1 second to allow network interface to initialize
sleep 1
discord --enable-features=UseOzonePlatform --ozone-platform-hint=wayland --enable-wayland-ime
