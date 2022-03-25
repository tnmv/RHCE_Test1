#!/bin/bash
#for host in ansible1.example.com ansible2.example.com ansible3.example.com ansible4.example.com ansible5.example.com
#do
 ansible all -m raw -a "dnf install python3 -y" -u root --ask-pass
 ansible  all -m user -a "name=junior state=present groups=wheel" -u root --ask-pass
 ansible all -m shell -a "echo 'Tenne1996' | passwd --stdin junior" -u root --ask-pass
 ansible all -m file -a "state=touch path=/etc/sudoers.d/junior" -u root --ask-pass
 ansible all -m copy -a "content='junior ALL=(ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/junior" -u root --ask-pass
 ansible all -m copy -a "src=/home/junior/.ssh/id_rsa.pub dest=/home/junior"  -u root --ask-pass
 ansible all -m authorized_key -a "user=junior state=present key='lookup(\'file\',\'/home/junior/id_rsa.pub\')' "  --ask-pass -u junior
 ansible all -m ping --ask-pass
#done
