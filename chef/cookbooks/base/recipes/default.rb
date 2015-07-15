#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "build-essential"

%w(libsqlite3-dev git).each do |pkg|
  package pkg do
    action :install
  end
end

#gem_package "mailcatcher" do
#  action :install
#end

#template "/etc/init.d/mailcatcher" do
#  source "mailcatcher.erb"
#  mode "0755"
#end

#service "mailcatcher" do
#  supports :status => true, :restart => true, :reload => true
#  action [ :enable, :start ]
#end
