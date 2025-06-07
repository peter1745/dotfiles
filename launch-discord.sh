#!/usr/bin/env bash

# Wait for 1 second to allow network interface to initialize
sleep 1
discord --ozone-platform-hint=auto --enable-wayland-ime
