#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pipenv lock --requirements > requirements.txt
docker build -t 360124560392.dkr.ecr.us-east-2.amazonaws.com/flaskbuddy:latest .
$(aws ecr get-login --no-include-email --region us-east-2)
docker push 360124560392.dkr.ecr.us-east-2.amazonaws.com/flaskbuddy:latest
