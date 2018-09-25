FROM centos/devtoolset-7-toolchain-centos7
FROM centos/python-35-centos7
MAINTAINER Guillaume Egles <gegles@us.ibm.com>

ENV CMAKE_VERSION_MAJOR "3"
ENV CMAKE_VERSION_MINOR "12"
ENV CMAKE_VERSION_PATCH "2"

USER root
RUN yum -y update \
	&& yum -y install epel-release \
	&& yum -y install yum-utils \
 	&& yum -y install wget golang dpkg \
 	&& yum clean all \
 	&& rm -rf /var/cache/yum

# CMake
RUN mkdir -p /tmp/cmake && \
    pushd /tmp/cmake && \
    wget https://cmake.org/files/v${CMAKE_VERSION_MAJOR}.${CMAKE_VERSION_MINOR}/cmake-${CMAKE_VERSION_MAJOR}.${CMAKE_VERSION_MINOR}.${CMAKE_VERSION_PATCH}-Linux-x86_64.sh && \
    bash cmake-${CMAKE_VERSION_MAJOR}.${CMAKE_VERSION_MINOR}.${CMAKE_VERSION_PATCH}-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir && \
    popd && \
    rm -rf /tmp/cmake

# Build directory
RUN mkdir -p /fasp.io

USER default
WORKDIR /fasp.io




