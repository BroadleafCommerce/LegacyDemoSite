@echo off
REM ## Startup script variables that you can/should change:
REM # JREBEL_PATH - local path to your jrebel dylib to be passed as -agentpath
REM #           example - /Users/you/jrebel/lib/libjrebel64.dylib
REM # DEBUG_PORT - defaults to 8001
REM # TOMCAT_MEMORY - Defaults to -Xmx1536M -XX:MaxPermSize=512M

set cwd=%cd%

REM # Do an install of the core jar in case anything changed since the last restart and we're not using jrebel
cd ../core
call mvn install

REM # Go back to where we just were to get ready to run the Tomcat Maven plugin
cd %cwd%

REM # Ensure that the spring-instrument jar gets downloaded and moved into target
call mvn dependency:copy@copy-agent

REM # Start up the embedded HSQLDB database in the background. If it's already started this won't do anything
call mvn antrun:run@hsqldb-start

setlocal
REM # grab the path to the JRebel agent and set up a JREBEL_AGENT variable to pass to the JVM
IF "%JREBEL_PATH%"=="" (SET JREBEL_AGENT=) ELSE (SET JREBEL_AGENT=-agentpath:%JREBEL_PATH%)

REM # Figure out a debug port
IF "%DEBUG_PORT%"=="" SET DEBUG_PORT=8001

IF "%TOMCAT_MEMORY%"=="" SET TOMCAT_MEMORY=-Xmx1536M -XX:MaxPermSize=512M

SET BROADLEAF_OPTS=%TOMCAT_MEMORY% -Xdebug -Xrunjdwp:transport=dt_socket,address=%DEBUG_PORT%,server=y,suspend=n -javaagent:target/agents/spring-instrument.jar %JREBEL_AGENT%

SET MAVEN_OPTS=%MAVEN_OPTS% %BROADLEAF_OPTS%

call mvn tomcat7:run-war
endlocal