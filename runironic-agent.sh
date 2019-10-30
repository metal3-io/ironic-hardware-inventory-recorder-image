#!/usr/bin/env bash

IRONIC_INSPECTOR_IP=${IRONIC_INSPECTOR_IP:-"mdns"}
IRONIC_INSPECTOR_PORT=${IRONIC_INSPECTOR_PORT:-"5050"}

if [[ ${IRONIC_INSPECTOR_IP} == "mdns" ]]; then
    URL_CALLBACK=${IRONIC_INSPECTOR_IP}
else
    URL_CALLBACK="http://${IRONIC_INSPECTOR_IP}:${IRONIC_INSPECTOR_PORT}/v1/continue"
fi

exec /usr/bin/ironic-collect-introspection-data \
    --inspection_callback_url ${URL_CALLBACK} \
    --introspection_daemon
