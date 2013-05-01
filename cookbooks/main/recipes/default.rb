package "mc"
package "vim"
package "git-core"
package "localepurge"

user node[:user][:name] do
  password node[:user][:password]
  gid "sudo"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end