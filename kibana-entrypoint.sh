#!/bin/bash
export ELASTICSEARCH_PASSWORD=`cat $ELASTICSEARCH_PASSWORD_FILE`
exec /usr/local/bin/kibana-docker
