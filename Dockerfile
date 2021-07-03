FROM ubuntu:latest

RUN apt update
RUN apt-get install -y wireguard wireguard-tools openresolv gettext-base curl wget pip
RUN mkdir -p ~/.kube
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
RUN pip install python-powerdns