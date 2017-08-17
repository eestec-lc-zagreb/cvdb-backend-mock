#!/bin/bash

SDIR=$(cd `dirname $0` && pwd)

nohup $(java -jar $SDIR/libs/wiremock-standalone-2.7.1.jar --port 61950 --verbose) > wiremock.log 2>&1 &

