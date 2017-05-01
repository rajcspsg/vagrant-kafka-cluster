package "openjdk-7-jre" do
  version '7u121-2.6.8-1ubuntu0.14.04.3'
end

package "zookeeper" do
  version '3.4.5+dfsg-1'
end

package "ufw" do
  action :purge
end

template '/var/lib/zookeeper/myid'

# Vagrant adds 127.0.0.1 <hostname> <hostname> which fucks up kafka
cookbook_file '/etc/hosts'
cookbook_file '/etc/zookeeper/conf/zoo.cfg'
cookbook_file '/etc/zookeeper/conf/environment'

execute '/usr/share/zookeeper/bin/zkServer.sh start'
