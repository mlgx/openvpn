FROM alekslitvinenk/openvpn

RUN sed -i '/push "/d' /etc/openvpn/server.conf
RUN echo -n "\nredirect-gateway def1" >> ./config/client.ovpn
