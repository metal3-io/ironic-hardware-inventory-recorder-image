FROM docker.io/centos:centos7

RUN yum install -y python-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python - current && \
    yum update -y && \
    yum install -y openstack-ironic-python-agent lshw smartmontools iproute python-hardware && \
    yum clean all

# NOTE(TheJulia/juliakreger): this command defaults to using multicast
# dns lookups.
ENTRYPOINT ["/usr/bin/ironic-collect-introspection-data", "--introspection_daemon"]
