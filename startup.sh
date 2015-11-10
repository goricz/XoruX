#!/bin/bash

if [ -f /firstrun ]
then
    # remote syslog server to docker host
    SYSLOG=`netstat -rn|grep ^0.0.0.0|awk '{print $2}'`
    echo "*.*	@$SYSLOG" > /etc/rsyslog.d/50-default.conf

    # Start syslog server to see something
    /etc/init.d/rsyslog start

    echo "Running for first time.. need to configure..."

    a2ensite lpar2rrd.conf stor2rrd.conf
    # a2ensite default-ssl
    # a2enmod ssl

    # Stopping ALL services so data can be moved if needed
    /etc/init.d/apache2 stop
    /etc/init.d/rsyslog stop

    # setup products
    su - lpar2rrd -c "cd /home/lpar2rrd/lpar2rrd-$LPAR_VER/; yes '' | ./install.sh"
    rm -r /home/lpar2rrd/lpar2rrd-$LPAR_VER
    su - lpar2rrd -c "cd /home/stor2rrd/stor2rrd-$STOR_VER/; yes '' | ./install.sh"
    rm -r /home/lpar2rrd/lpar2rrd-$STOR_VER

    # clean up
    rm /firstrun
fi

# Sometimes with un unclean exit the rsyslog pid doesn't get removed and refuses to start
if [ -f /var/run/rsyslogd.pid ]
    then rm /var/run/rsyslogd.pid
fi

# Start supervisor to start the services
/usr/bin/supervisord


