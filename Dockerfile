FROM docker.io/centos:centos7

RUN yum install -y python-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python - -b train current-tripleo && \
    yum update -y && \
    yum install -y openstack-ironic-python-agent lshw smartmontools iproute python-hardware && \
    yum clean all

COPY ./runironic-agent.sh /bin/runironic-agent

ENTRYPOINT ["/bin/runironic-agent"]