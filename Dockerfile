FROM centos:latest

RUN yum -y install epel-release && yum clean all
RUN yum -y groupinstall "Development tools" && yum clean all
RUN yum -y install python-pip python-devel openssl-devel sudo && yum clean all
RUN pip install --upgrade pip
RUN pip install git+git://github.com/ansible/ansible.git@stable-2.4
RUN pip install paramiko PyYAML Jinja2 httplib2 six shade boto boto3 awscli ansible-tower-cli
RUN pip install azure==2.0.0rc5
RUN pip install python-openstackclient python-novaclient python-glanceclient python-swiftclient python-neutronclient python-cinderclient python-heatclient
RUN adduser -u 501 --no-create-home --home-dir /Users/chocker chocker
RUN sed --in-place 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers
RUN usermod -a -G wheel chocker
USER chocker
WORKDIR /Users/chocker