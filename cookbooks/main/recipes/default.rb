package "mc"
package "lynx"
package "vim"
package "git-core"
package "localepurge"

include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_ssl"
include_recipe "logrotate"
include_recipe "zabbix"

user node[:user][:name] do
  password node[:user][:password]
  gid "sudo"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end

hostname = node[:hostname]

file '/etc/hostname' do
  content "#{hostname}\n"
end

service 'hostname' do
  action :restart
end

service 'mysql' do
  action :restart
end

file '/etc/hosts' do
  content "127.0.0.1 localhost #{hostname}\n"
end

apache_site "default" do
  enable false
end

node.set['zabbix']['web']['fqdn'] = hostname