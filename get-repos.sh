#!/bin/bash -v

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release &&
mkdir -p /root/repos &&
for repo in \
rhel-7-server-rpms \
rhel-7-server-extras-rpms \
rhel-7-server-ansible-2.6-rpms \
rhel-7-server-ose-3.11-rpms
do
  reposync --gpgcheck -lm --repoid=${repo} --download_path=/root/repos 
  createrepo -v /root/repos/${repo} -o /root/repos/${repo} 
done
