FROM ubuntu:17.10

RUN apt-get -y update && apt-get -y dist-upgrade
RUN apt-get -y install firefox iputils-ping curl wget

ADD synergy_2.0.2.stable~b1046+665fa610_amd64.deb .
RUN dpkg -i synergy_2.0.2.stable~b1046+665fa610_amd64.deb ; apt-get -y -f install

ENV LIBGL_ALWAYS_SOFTWARE 1
ENV QMLSCENE_DEVICE softwarecontext

ADD entrypoint.sh .
CMD ["/bin/bash", "entrypoint.sh"]
