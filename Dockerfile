FROM quay.io/centos/centos:stream8

RUN dnf install -y python3 python3-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/plugins/module_utils/tripleo_repos/main.py | python3 - -b master current-tripleo && \
    dnf upgrade -y && \
    dnf install -y openstack-ironic-python-agent lshw smartmontools \
      iproute python3-hardware-detect mdadm biosdevname ipmitool && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

COPY ./runironic-agent.sh /bin/runironic-agent

ENTRYPOINT ["/bin/runironic-agent"]

