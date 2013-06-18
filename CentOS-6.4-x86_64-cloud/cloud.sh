# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

yum -y install cloud-init cloud-utils

rm /etc/udev/rules.d/70-persistent-net.rules
cat > /etc/udev/rules.d/70-persistent-net.rules << EOM
ACTION=="add",SUBSYSTEM=="net", IMPORT{program}="/lib/udev/rename_device"
SUBSYSTEM=="net", RUN+="/etc/sysconfig/network-scripts/net.hotplug"
EOM

cat >> /etc/sysconfig/network << EOM
NOZEROCONF=yes
EOM
