FROM grafana/grafana

USER root
RUN apt-get update \
 && apt-get -y --no-install-recommends install \
        git \
 && apt-get clean \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY ./install.sh /install.sh

USER grafana
ENTRYPOINT ["/install.sh"]
