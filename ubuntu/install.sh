#!/bin/bash
echo "Backing up default configuration files by appending .default at the end of each copy"
cp /etc/sysctl.conf /etc/sysctl.conf.default
cp /etc/default/grub /etc/default/grub.default
cp /etc/rc.local /etc/rc.local.default

echo "Installing files"
cp sysctl.conf /etc/sysctl.conf
cp rc.local /etc/rc.local
sed s/GRUB_CMDLINE_LINUX_DEFAULT\=\"\"/GRUB_CMDLINE_LINUX_DEFAULT\=\"cgroup_disable=cpuset,cpu,cpuacct,blkio,memory,devices,freezer,net_cls,perf_event,net_prio,hugetlb,pids,rdma ipv6.disable\=1 systemd.gpt_auto\=0\"/g /etc/default/grub
