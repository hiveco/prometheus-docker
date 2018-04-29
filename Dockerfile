FROM prom/prometheus:master

ENV \
    ARG_COMMAND=/bin/prometheus \
    ARG_PREFIX=PROM_ \
    PROM_CONFIG_FILE=/etc/prometheus/prometheus.yml \
    PROM_STORAGE_TSDB_PATH=/prometheus \
    PROM_WEB_CONSOLE_LIBRARIES=/usr/share/prometheus/console_libraries \
    PROM_WEB_CONSOLE_TEMPLATES=/usr/share/prometheus/consoles

ADD entrypoint.sh /entrypoint
ENTRYPOINT [ "/entrypoint" ]
