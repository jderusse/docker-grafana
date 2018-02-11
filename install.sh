#!/bin/sh

if [ ! -z "${GF_INSTALL_PLUGINS_GIT}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GF_INSTALL_PLUGINS_GIT}; do
    IFS=$OLDIFS
    git clone --branch master --depth 1 "${plugin}" "${GF_PATHS_PLUGINS:-/var/lib/grafana/plugins}/$(basename "$plugin")"
  done
fi

exec /run.sh