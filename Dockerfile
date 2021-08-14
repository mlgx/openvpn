FROM alekslitvinenk/openvpn

RUN sed -i '/push "/d' /etc/openvpn/server.conf
RUN printf '\nredirect-gateway def1' >> ./config/client.ovpn
