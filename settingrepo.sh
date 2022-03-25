#!/bin/bash
#for host in ansible1.example.com ansible2.example.com ansible3.example.com ansible4.example.com ansible5.example.com
#do
  ansible all -m file -a "state=directory path=/var/ftp/repo/" -u root --ask-pass
  ansible all -m mount -a "state=present fstype=iso9660 src=/dev/cdrom path=/var/ftp/repo" -u root --ask-pass 
  ansible all -m command -a "mount -a" -u root --ask-pass
  ansible all -m yum_repository -a "name='BaseOS' file=BaseOS baseurl=file:///var/ftp/repo/BaseOS description='BaseOS Repository' gpgcheck=0 enabled=1" -u root --ask-pass 
  ansible all -m yum_repository -a "name='AppStream' file=AppStream baseurl=file:///var/ftp/repo/AppStream description='AppStream Repository' gpgcheck=0 enabled=1" -u root --ask-pass 
#done
