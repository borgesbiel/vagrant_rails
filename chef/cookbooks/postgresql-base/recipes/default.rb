#
# Cookbook Name:: postgresql-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "postgresql::server_debian"

execute "drop postgresql cluster" do
  command "pg_dropcluster --stop 9.1 main"
  user "postgres"
  action :run
end

execute "locale gen #{node['postgresql']['server']['locale']}" do
  command "locale-gen #{node['postgresql']['server']['locale']}"
  action :run
end

execute "create postgresql cluster" do
  command "pg_createcluster --start -e #{node['postgresql']['server']['encoding']} --locale=#{node['postgresql']['server']['locale']} #{node['postgresql']['version']} main"
  action :run
end

include_recipe "postgresql::server"