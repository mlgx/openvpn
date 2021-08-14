FROM alekslitvinenk/openvpn

# Move config from server to client.
# Forcing config is not nice.
# Some clients are unable to ignore it.
RUN echo >> ./config/client.ovpn
RUN grep 'push "' /etc/openvpn/server.conf | sed 's/push "\(.*\)"/\1/' >> ./config/client.ovpn
RUN sed -i '/push "/d' /etc/openvpn/server.conf
