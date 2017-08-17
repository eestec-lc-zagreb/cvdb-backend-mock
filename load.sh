#!/bin/bash

SDIR=$(cd `dirname $0` && pwd)
WSRV=http://localhost:61950

# load mappings
curl -X DELETE $WSRV/__admin/mappings
find $SDIR -name \*.json -exec curl $WSRV/__admin/mappings --data-binary @{} \;

# load settings
SETTINGS="{ \
              \"delayDistribution\": { \
                      \"type\": \"lognormal\", \
                      \"median\": 90, \
                      \"sigma\": 0.1 \
              } \
          }"


SETTINGS_URL="$WSRV/__admin/settings"

curl -X POST $SETTINGS_URL --data-binary "$SETTINGS";