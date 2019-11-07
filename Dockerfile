FROM r-base:latest

RUN apt-get -qq update && \
    apt-get -qqy install libcurl4-openssl-dev libssl-dev libxml2-dev python3 python3-pip git && \
    apt-get -qq clean autoclean &&\
    apt-get -qq autoremove --yes

RUN  R --slave -e "install.packages(c('xml2'), dependencies = TRUE)"
RUN  R --slave -e "install.packages(c('MCMCpack', 'irtoys', 'lintr', 'doParallel', 'RUnit', 'pryr'), dependencies = TRUE)"

RUN pip3 install numpy scipy flake8
