FROM centos:6
MAINTAINER Michael Daffin <michael.daffin@switchconcepts.com>

WORKDIR /build
VOLUME /build

RUN echo "multilib_policy=best" >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y boost-devel log4cpp-devel \
                   cmake make gcc gcc-c++ \
                   ruby rubygems ruby-devel rpm-build && \
    gem install cabin -v 0.7.2 && \
    gem install fpm -v 1.3.3 && \
    yum clean all
