FROM ubuntu:16.04

COPY id_rsa* /root/.ssh/

RUN \
  apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python2.7 && \
  useradd -m -s /bin/bash ubuntu && \
  mkdir /home/ubuntu/.ssh && \
  cp /root/.ssh/id_rsa* /home/ubuntu/.ssh/ && \
  echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
  cat /root/.ssh/id_rsa.pub >> /home/ubuntu/.ssh/authorized_keys && \
  mkdir /var/run/sshd && \
  ln -s /usr/bin/python2.7 /usr/bin/python

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
