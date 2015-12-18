FROM centos:6
MAINTAINER Michael Daffin <michael.daffin@switchconcepts.com>

WORKDIR /build
VOLUME /build

RUN echo "multilib_policy=best" >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y boost-devel log4cpp-devel \
                   cmake make gcc gcc-c++ \
                   ruby rubygems ruby-devel && \
    gem install fpm && \
    yum remove -y ruby-devel && \
    yum clean all
