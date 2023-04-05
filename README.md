# metal3-hardware-inventory-recorder

Provides an container which containers the ironic-python-agent
launched in a mode where introspection data is periodically
transmitted to an attached ironic-inspector instance.

The ironic-inspector is service located via mdns name
*baremetal-introspection._openstack._tcp.local.*

Run the container using the `--privileged --network=host -v /dev:/dev` options.
