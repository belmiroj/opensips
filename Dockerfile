FROM centos:centos6.9
MAINTAINER belmiro1991@gmail.com

RUN yum -y install git gcc gcc-c++ bison flex zlib-devel openssl-devel mysql mysql-server mysql-devel subversion pcre-devel ncurses-devel ncurses

RUN git clone https://github.com/OpenSIPS/opensips.git -b 2.2 ~/opensips_2_2 && \
    sed -i 's/db_http db_mysql db_oracle/db_http db_oracle/g' ~/opensips_2_2/Makefile.conf.template && \
    cd ~/opensips_2_2 && \
    make all && make install && \
    cd .. && rm -rf ~/opensips_2_2

EXPOSE 5060/TCP
EXPOSE 5060/UDP

ENTRYPOINT ["/usr/local/sbin/opensips", "-D"]
