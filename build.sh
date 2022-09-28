#!/bin/bash
git tag -a v$1 -m "Version $1"
docker build -t osirisguitar/viking-gpt2:$1 -f Dockerfile .
docker push osirisguitar/viking-gpt2:$1
