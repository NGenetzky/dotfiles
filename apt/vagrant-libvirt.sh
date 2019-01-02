#!/bin/bash

sudo apt-get update
sudo apt-get install vagrant

# https://github.com/vagrant-libvirt/vagrant-libvirt#installation
sudo apt-get build-dep \
  vagrant \
  ruby-libvirt \

sudo apt-get install \
  dnsmasq-base \
  ebtables \
  libvirt-bin \
  libvirt-dev \
  libxml2-dev \
  libxslt-dev \
  qemu \
  ruby-dev \
  zlib1g-dev
