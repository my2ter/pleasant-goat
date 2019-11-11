#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc8ef905dfeba0019eff567/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc8ef905dfeba0019eff567
curl -s -X POST https://api.stackbit.com/project/5dc8ef905dfeba0019eff567/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5dc8ef905dfeba0019eff567/webhook/build/publish > /dev/null
