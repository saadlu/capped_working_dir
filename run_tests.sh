#!/bin/sh

docker run -it -v "$PWD:/code" bats/bats:latest /code/test