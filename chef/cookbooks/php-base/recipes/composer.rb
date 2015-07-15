#
# Cookbook Name:: php-base
# Recipe:: composer
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
package "curl"
package "git"

execute "composer install" do
  command "curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer"
  creates "/usr/bin/composer"
  action :run
end

#Keep composer at the last version
execute "composer update" do
  command "composer self-update"
  action :run
end