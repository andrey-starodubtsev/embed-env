#!/usr/bin/env bash

set -ex -o posix -o pipefail

case EMBED_ENV in
  dev)
    which arm-eabi-gcc
    arm-eabi-gcc --version
    ;;
  qa)
    ;;
esac
