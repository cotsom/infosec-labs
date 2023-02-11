#!/bin/bash

docker tag $1 cotsom/$2:latest
docker push cotsom/$2:latest
