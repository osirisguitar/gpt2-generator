#!/bin/bash
git tag -a v$1-xeon5620 -m "Version $1"
docker build -t osirisguitar/viking-gpt2:$1-xeon5620 -f Dockerfile-xeon5620 .
docker push osirisguitar/viking-gpt2:$1-xeon5620
