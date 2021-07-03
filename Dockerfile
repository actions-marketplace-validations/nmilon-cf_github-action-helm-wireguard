FROM ubuntu:latest

RUN sudo apt-get install -y wireguard wireguard-tools resolvconf
RUN mkdir -p ~/.kube;\
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"; \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl; \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
    pip install python-powerdns