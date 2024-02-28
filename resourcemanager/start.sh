#!/bin/sh

#$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager
service ssh start && tail -f /dev/null