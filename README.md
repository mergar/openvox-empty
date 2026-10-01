Install official OPENVOX repo:

Debian 13:
```
apt-get -y install ca-certificates
cd /tmp && wget https://apt.voxpupuli.org/openvox8-release-debian13.deb
apt-get install /tmp/openvox8-release-debian13.deb

apt update```

apt install -y openvox-agent

cat > /etc/puppet/puppet.conf <<EOF
[agent]
server = openvox1.convectix.com
pluginsync = true
show_diff = true
report = true
environment = production
runinterval = 3600
#logdest = /var/log/puppet/puppetd.log
#puppetdlog = /var/log/puppet/puppetd.log
EOF
