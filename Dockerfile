FROM alpine

RUN apk --update --no-cache add bash rtl-sdr mqttui libstdc++ && \
     apk add --no-cache --virtual build-deps \
       build-base git librtlsdr-dev linux-headers ncurses-dev && \
     git clone https://github.com/xaelsouth/rtl-wmbus.git && \
     cd rtl-wmbus && \
     make release && make install && \
     cd .. && \
     rm -rf rtl-wmbus && \
     git clone https://github.com/weetmuts/wmbusmeters.git && \
     cd wmbusmeters && \
     make && make install && \
     cd .. && \
     rm -rf wmbusmeters && \
     apk del --purge build-deps
