#
# Cookbook Name:: rails-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "ruby_install"

ruby_install_ruby "ruby #{node['chruby']['default']}"

include_recipe "chruby"

gem_binary_path = "#{node['ruby_install']['default_ruby_base_path']}/ruby-#{node['chruby']['default']}/bin/gem"

gem_package 'bundler' do
  gem_binary gem_binary_path
  options "--no-document"
end

include_recipe "postgresql-base"
include_recipe "nodejs-base"

%w(libmagickwand4 libmagickwand-dev xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic).each do |pkg|
  package pkg do
    action :install
  end
end
