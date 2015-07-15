#
# Cookbook Name:: nodejs-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
package "python-software-properties" do
  action :install
end

execute "add chris-lea/node.js repository" do
  command "sudo add-apt-repository ppa:chris-lea/node.js && apt-get update"
  action :run
end

package "nodejs" do
  action :install
end
