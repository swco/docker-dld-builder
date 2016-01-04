FROM centos:5
MAINTAINER Michael Daffin <michael.daffin@switchconcepts.com>

WORKDIR /build
VOLUME /build

RUN echo "multilib_policy=best" >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y boost141-devel log4cpp-devel python26-argparse which \
                   cmake make gcc gcc-c++ \
                   rpm-build && \
    yum clean all
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /usr/local/rvm/bin/rvm install 1.8.7
RUN bash -lc "rvm use 1.8.7 --default"
RUN bash -lc "gem install cabin -v 0.7.2 && gem install fpm -v 1.3.3"
RUN ln -sf /usr/bin/python2.6 /usr/bin/python2
