FROM r-base:latest

RUN apt-get -qq update && \
    apt-get -qqy install libcurl4-openssl-dev libssl-dev libxml2-dev python3 && \
    apt-get -qq clean autoclean &&\
    apt-get -qq autoremove --yes

RUN  R --slave -e "install.packages(c('xml2'), dependencies = TRUE)"
RUN  R --slave -e "install.packages(c('MCMCpack', 'irtoys', 'lintr'), dependencies = TRUE)"
