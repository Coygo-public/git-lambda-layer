#!/bin/sh

export GIT_VERSION=2.24.0
export CURL_VERSION=7.67.0

rm layer.zip

docker run --rm -v "$PWD":/tmp/layer lambci/yumda:2 bash -c "
  yum install -y git-${GIT_VERSION} curl-${CURL_VERSION} && \
  cd /lambda/opt && \
  zip -yr /tmp/layer/layer.zip .
"
