FROM centos:7
ENV container docker
RUN yum update -y
RUN yum install -y curl
RUN yum install -y git
RUN yum install -y make
RUN yum install -y zip

# Install GO
WORKDIR /tmp
RUN curl -LO https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
RUN sha256sum go1.7*.tar.gz
RUN tar -C /usr/local -xvzf go1.7.5.linux-amd64.tar.gz
RUN /bin/bash -c 'echo PATH=$PATH:/usr/local/go/bin > /etc/profile.d/path.sh'

# Copy in build script
COPY ["internal_resources/build.sh", "/tmp/build.sh"]
RUN chown 777 build.sh
RUN chmod +x build.sh

# Set up user account
RUN useradd -u 1000 docker
USER docker

# Copy in build script
RUN cp /tmp/build.sh /home/docker/build.sh

# Change to /home/docker
WORKDIR /home/docker

# Set up build area
RUN mkdir -p ~/projects/{bin,pkg,src}
RUN echo "export GOBIN=/home/docker/projects/bin" >> /home/docker/.bash_profile
RUN echo "export GOPATH=/home/docker/projects" >> /home/docker/.bash_profile

ENTRYPOINT ["/bin/bash", "-lc", "/home/docker/build.sh"]