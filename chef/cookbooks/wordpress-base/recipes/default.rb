#
# Cookbook Name:: wordpress-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "php-base"
include_recipe "php-base::version_5.4"

node['wordpress']['web_app'].each do |site|
  web_app site[:name] do
    server_port site[:server_port]
    server_name site[:server_name]
    server_aliases site[:server_aliases]
    docroot site[:docroot]
    allow_override site[:allow_override]
    directory_index site[:directory_index]
  end
end

package "php-pear" do
  action :install
end

include_recipe "wordpress::default"