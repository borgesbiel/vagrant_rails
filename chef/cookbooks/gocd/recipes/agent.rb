#
# Cookbook Name:: gocd
# Recipe:: agent
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "go.cd"

remote_file "/opt/go-agent.deb" do
  owner "root"
  group "root"
  mode "0755"
  source "http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb"
  checksum "1259d8e423e7dcf9f899c50baa5783cfe45db76c07573e0daf3f979170cc91d8"
end

dpkg_package "go-agent" do
  source "/opt/go-agent.deb"
  action :install
end

service "go-agent" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/default/go-agent" do
  source "go-agent.erb"
  owner "go"
  group "go"
  mode "0644"
  variables({
    :go_server_host => node['gocd']['agent']['server_url']
  })
  notifies :restart, "service[go-agent]"
end

execute "generate ssh keys for go" do
  user 'go'
  creates "/var/go/.ssh/id_rsa.pub"
  command 'ssh-keygen -t rsa -q -f /var/go/.ssh/id_rsa -P ""'
end

template "/var/go/.bash_profile" do
  source "bash_profile.erb"
  owner "go"
  group "go"
  mode "0664"
end

template "/var/go/.bashrc" do
  source "bashrc.erb"
  owner "go"
  group "go"
  mode "0664"
end

include_recipe "rails-base"
