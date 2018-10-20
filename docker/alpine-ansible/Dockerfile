FROM jfloff/alpine-python:3.6

RUN apk add --no-cache \
    curl \
    openssh-client \
    py-boto \
    py-dateutil \
    py-httplib2 \
    py-jinja2 \
    py-paramiko \
    py-pip \
    py-setuptools \
    py-yaml \
    python \
    tar \
  && pip install --upgrade \
    pip \
    python-keyczar

# RUN pip install --upgrade pip \
#   && pip install ansible

RUN mkdir /etc/ansible/ /ansible
RUN echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

# https://github.com/ansible/ansible/releases/download/v2.0.0.1-1/ansible-2.0.0.1.tar.gz
# https://releases.ansible.com/ansible/ansible-2.0.0.1.tar.gz
RUN \
  curl -fsSL "https://releases.ansible.com/ansible/ansible-2.0.0.1.tar.gz" -o ansible.tar.gz \
  && tar -xzf ansible.tar.gz -C ansible --strip-components 1 \
  && rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging \
  && ( cd ansible ; python setup.py install )
