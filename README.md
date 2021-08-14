# OpenVPN
Dockerized OpenVPN server.  
Docker Hub: https://hub.docker.com/r/mlgx/openvpn

"Fork" of [dockovpn/docker-openvpn](https://github.com/dockovpn/docker-openvpn).

Removes all `push` directives from the server config.  
It is best practice not to force anything onto the client.

Dockovpn currently pushes the following configuration:

```
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 208.67.222.222"
push "dhcp-option DNS 208.67.220.220"
```

If the client whishes to use a different configuration they need to make changes that are not so evident.
Here is the wiki page explaining how to ignore pushed route configuration: [Ignore Redirect Gateway](https://community.openvpn.net/openvpn/wiki/IgnoreRedirectGateway).
Note that method #1 which uses the `pull-filter` directive [does not work on iOS](https://forums.openvpn.net/viewtopic.php?t=28223) since that directive is not supported.
With method #2 you can run into [hard to debug issues](https://openvpn.net/faq/overriding-a-pushed-route-in-the-clients-config-throws-an-error). And method #3 is just... convoluted.

It is a lot easier to simply remove or edit the rules that one does not wish to have.

## Example docker-compose

```
version: "2.0"

services:
  openvpn:
    image: mlgx/openvpn
    container_name: openvpn
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    ports:
      - 1194:1194/udp
    volumes:
      - ./openvpn_conf:/doc/Dockovpn
    environment:
        HOST_ADDR: ${HOST_ADDR} 
```

Follow instructions for Dockovpn: https://github.com/dockovpn/docker-openvpn#alternative-way-run-with-docker-compose
