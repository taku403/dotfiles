#!/bin/bash

datetime="$(date) host-computer is $(cat /etc/hostname)"

git commit -m $datetime
