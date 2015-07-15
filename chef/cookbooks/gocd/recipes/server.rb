#
# Cookbook Name:: go.cd
# Recipe:: server
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "go.cd"

execute "create swap space" do
  command "dd if=/dev/zero of=/swap bs=1M count=2048"
  creates "/swap"
  action :run
end

execute "mkswap" do
  command "mkswap /swap"
  action :run
end

execute "activate swap" do
  command "swapon /swap"
  action :run
end

remote_file "/opt/go-server.deb" do
  owner "root"
  group "root"
  mode "0755"
  source "http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb"
  checksum "149070fe80789c7d4dd8a997b165167eb5836c5ecc812294324bd4edb167b792"
end

dpkg_package "go-server" do
  source "/opt/go-server.deb"
  action :install
end

execute "generate ssh keys for go" do
  user 'go'
  creates "/var/go/.ssh/id_rsa.pub"
  command 'ssh-keygen -t rsa -q -f /var/go/.ssh/id_rsa -P ""'
end

service "go-server" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
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

template "#{node['gocd']['server']['password_file_path']}" do
  source "htpasswd.erb"
  owner "go"
  group "go"
  mode "0600"
  only_if { !node['gocd']['server']['admin_password'].empty? }
end

template "/etc/go/cruise-config.xml" do
  source "cruise-config.xml.erb"
  owner "go"
  group "go"
  mode "0644"
  variables({
    :password_file_path => node['gocd']['server']['password_file_path']
  })
  notifies :restart, "service[go-server]"
end

