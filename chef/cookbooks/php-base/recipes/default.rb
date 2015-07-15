#
# Cookbook Name:: php-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "build-essential"
include_recipe "apache2::mod_env"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_include"
include_recipe "mysql::client"
include_recipe "php::module_gd"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "php::module_fpdf"
include_recipe "php::package"

