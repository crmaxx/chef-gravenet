package "mc"
package "vim"
package "git-core"
package "localepurge"

include_recipe "logrotate"
include_recipe "zabbix"

user node[:user][:name] do
  password node[:user][:password]
  gid "sudo"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end