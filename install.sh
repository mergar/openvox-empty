#!/bin/sh
#sysutils/openvox-agent8 replaces sysutils/puppet8;
#sysutils/openvox-server8 replaces sysutils/puppet-server8;
#databases/openvoxdb8 replaces databases/puppetdb8;
#databases/openvoxdb-terminus8 replaces databases/puppetdb-terminus8;
#sysutils/rubygem-openbolt replaces sysutils/rubygem-bolt;
#sysutils/rubygem-openfact replaces sysutils/rubygem-facter.


#pkg install -y puppet8 puppetserver8 rubygem-hiera rubygem-hiera-eyaml rubygem-hiera-file git rubygem-psych
pkg install sysutils/openvox-agent8 \
	sysutils/openvox-server8 \
	databases/openvoxdb8 \
	databases/openvoxdb-terminus8 \
	sysutils/rubygem-openbolt \
	sysutils/rubygem-openfact

#proc    /proc           procfs          rw      0       0


#puppetserver gem install hiera-eyaml eyaml
puppetserver gem install hiera-eyaml

echo '127.0.0.1 puppet' >> /etc/hosts

mv /usr/local/etc/puppet /usr/local/etc/puppet-o

git clone https://github.com/mergar/openvox-empty /usr/local/etc/puppet
rm -rf /usr/local/etc/puppet/.git

chown -R puppet:puppet /var/puppet
service puppetserver enable
service puppetserver start
#puppet module install puppet-pkgng --version 5.0.0
