# metal3-hardware-inventory-recorder

## Archival notice

> Community has decided to archive this repository on 1st March 2026,
> as it has not been actively used or maintained for several years.

Provides an container which containers the ironic-python-agent
launched in a mode where introspection data is periodically
transmitted to an attached ironic-inspector instance.

The ironic-inspector is service located via mdns name
*baremetal-introspection._openstack._tcp.local.*

Run the container using the `--privileged --network=host -v /dev:/dev` options.
