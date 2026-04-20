#!/usr/bin/env bash

export BG_IMAGE=$1
systemctl --user set-environment BG_IMAGE=$1
systemctl --user daemon-reload
systemctl --user restart swaybg.service

