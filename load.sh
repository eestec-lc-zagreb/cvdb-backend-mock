#!/bin/bash

SDIR=$(cd `dirname $0` && pwd)
WSRV=http://localhost:61950

curl -X DELETE $WSRV/__admin/mappings
find $SDIR -name \*.json -exec curl $WSRV/__admin/mappings --data-binary @{} \;

