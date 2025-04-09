ARG BASE_IMAGE=quay.io/centos/centos:stream9

FROM $BASE_IMAGE

# image.version is set during image build by automation
LABEL org.opencontainers.image.authors="metal3-dev@googlegroups.com"
LABEL org.opencontainers.image.description="Container image to run Ironic HW Inventory Recorder as part of Metal³"
LABEL org.opencontainers.image.documentation="https://github.com/metal3-io/ironic-hardware-inventory-recorder-image"
LABEL org.opencontainers.image.licenses="Apache License 2.0"
LABEL org.opencontainers.image.title="Metal3 Ironic HW Inventory Recorder"
LABEL org.opencontainers.image.url="https://github.com/metal3-io/ironic-hardware-inventory-recorder-image"
LABEL org.opencontainers.image.vendor="Metal3-io"

RUN dnf install -y python3 python3-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/plugins/module_utils/tripleo_repos/main.py | python3 - -b master current-tripleo && \
    dnf upgrade -y && \
    dnf install -y openstack-ironic-python-agent lshw smartmontools \
      iproute python3-hardware-detect mdadm biosdevname ipmitool && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

COPY ./runironic-agent.sh /bin/runironic-agent

ENTRYPOINT ["/bin/runironic-agent"]
