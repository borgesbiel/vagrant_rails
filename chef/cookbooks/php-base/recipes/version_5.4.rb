#
# Cookbook Name:: php-base
# Recipe:: version_5.4
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
package "python-software-properties"

execute "add ondrej/php5 repository" do
  command "sudo add-apt-repository -y ppa:ondrej/php5-oldstable && apt-get update"
  action :run
end

execute "apt-get update" do
  command "sudo apt-get update"
  action :run
end

package "php5" do
  action :install
end