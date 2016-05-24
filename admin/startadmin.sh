#!/bin/bash

## Startup script variables that you can/should change:
# JREBEL_PATH - local path to your jrebel dylib to be passed as -agentpath
#           example - /Users/you/jrebel/lib/libjrebel64.dylib
# DEBUG_PORT - defaults to 8001
# TOMCAT_MEMORY - Defaults to -Xmx1536

cwd=$(pwd)

# Do an install of the core jar in case anything changed since the last restart and we're not using jrebel
cd ../core
mvn install

# Go back to where we just were to get ready to run the Tomcat Maven plugin
cd $cwd

# Ensure that the spring-instrument jar gets downloaded and moved into target
mvn dependency:copy@copy-agent

# Start up the embedded HSQLDB database in the background. If it's already started this won't do anything
mvn antrun:run@hsqldb-start &

# grab the path to the JRebel agent and set up a JREBEL_AGENT variable to pass to the JVM
if [ -z ${JREBEL_PATH+x} ]; then JREBEL_AGENT=""; else JREBEL_AGENT="-agentpath:$JREBEL_PATH"; fi

# Figure out a debug port
if [ -z ${DEBUG_PORT+x} ]; then DEBUG_PORT="8001"; fi

if [ -z ${TOMCAT_MEMORY+x} ]; then TOMCAT_MEMORY="-Xmx1536M -XX:MaxPermSize=512M"; fi

export BROADLEAF_OPTS="$TOMCAT_MEMORY -Xdebug -Xrunjdwp:transport=dt_socket,address=$DEBUG_PORT,server=y,suspend=n -javaagent:target/agents/spring-instrument.jar $JREBEL_AGENT"

MAVEN_OPTS="$MAVEN_OPTS $BROADLEAF_OPTS" mvn tomcat7:run-war
