FROM docker.io/centos:centos8

RUN dnf install -y python3 python3-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python3 - -b train current && \
    dnf install -y epel-release 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled PowerTools && \
    dnf upgrade -y && \
    dnf install -y openstack-ironic-python-agent lshw smartmontools \
      iproute python3-hardware-detect mdadm biosdevname ipmitool && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

COPY ./runironic-agent.sh /bin/runironic-agent

ENTRYPOINT ["/bin/runironic-agent"]

