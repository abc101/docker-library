#!/bin/bash

## 
# Sakai local properies
##

# ENV DATABASE mariadb
# ENV DATABASE_SERVER 127.0.0.1:3306
sed -i "s/db_server/$DATABASE_SERVER/g" ${CATALINA_HOME}/sakai/local.properties
# ENV SAKAI_DATABASE sakai
sed -i "s/db_schema/$DATABASE/g" ${CATALINA_HOME}/sakai/local.properties
# ENV SAKAI_DATABASE_USER sakai
sed -i "s/db_user/$DATABASE_USER/g" ${CATALINA_HOME}/sakai/local.properties
# ENV SAKAI_DATABASE_PASSWORD sakai201
sed -i "s/db_password/$DATABASE_PASSWORD/g" ${CATALINA_HOME}/sakai/local.properties

# Add context option
CONTENT='<JarScanner>\n\t<JarScanFilter defaultPluggabilityScan="false"/>\n</JarScanner>\n'; \
C=$(echo $CONTENT | sed 's/\//\\\//g') ; \
sed -i "/<\/Context>/ s/.*/${C}\n&/" ${CATALINA_HOME}/conf/context.xml

exec "$@"
