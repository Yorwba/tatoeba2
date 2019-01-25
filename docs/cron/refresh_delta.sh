#!/bin/bash
set -e

PIDFILE=/var/run/sphinxsearch/searchd.pid

systemctl show -p MainPID --value sphinxsearch > $PIDFILE
/usr/bin/time -p -a -o /tmp/sphinx.delta.update.log /var/www-prod/bin/cake sphinx_indexes update delta >/dev/null 2>&1