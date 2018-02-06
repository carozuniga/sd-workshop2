su -c 'rpm -Uvh http://mirror.upb.edu.co/epel//7/x86_64/Packages/e/epel-release-7-11.noarch.rpm'
yum install erlang -y
su -c 'rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.9/rabbitmq-server-3.6.9-1.el7.noarch.rpm'
service rabbitmq-server start
sudo rabbitmqctl add_vhost /sensu
sudo rabbitmqctl add_user sensu password
sudo rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"
rabbitmq-plugins enable rabbitmq_management
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"



