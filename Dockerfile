FROM eclipse/cpp_gcc
LABEL che:server:80:ref=nginx che:server:80:protocol=http
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN sudo apt-get update
RUN sudo apt-get -yq install valgrind curl vim-nox nginx
#cmake install per EricCrosson/latex-cmake
RUN sudo -s bash -c 'curl -sSL https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz | tar -xzC /opt'
RUN sudo -s bash -c 'ln -s /opt/cmake-3.10.2-Linux-x86_64/bin/cmake /usr/bin/cmake'
RUN sudo -s bash -c 'ln -s /opt/cmake-3.10.2-Linux-x86_64/bin/cpack /usr/bin/cpack'
RUN sudo -s bash -c 'ln -s /opt/cmake-3.10.2-Linux-x86_64/bin/ctest /usr/bin/ctest'
# so the git-credentials agent can create git.sh
COPY nginx_default /etc/nginx/sites-available/default
RUN mkdir -p /home/user/.ssh
