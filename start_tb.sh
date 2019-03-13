#!/bin/bash

INSTALL_DIR=/usr/share/thingsboard
CONF_FOLDER="$INSTALL_DIR/conf"
jarfile=$INSTALL_DIR/bin/thingsboard.jar
configfile=thingsboard.conf
firstlaunch=/.firstlaunch

if [ ! -f ${firstlaunch} ]
then
	if [ "$LOAD_DEMO" == "true" ]
	then
		/usr/share/thingsboard/bin/install/install.sh --loadDemo
	else
		/usr/share/thingsboard/bin/install/install.sh
	fi
	touch ${firstlaunch}
fi

echo "Starting ThingsBoard ..."

java -cp ${jarfile} $JAVA_OPTS -Dloader.main=org.thingsboard.server.ThingsboardServerApplication \
                    -Dspring.jpa.hibernate.ddl-auto=none \
                    -Dlogging.config=${CONF_FOLDER}/logback.xml \
                    org.springframework.boot.loader.PropertiesLauncher

sleep 10
tail -F /var/log/thingsboard/thingsboard.log
