#
# Cookbook Name:: nodejs-base
# Recipe:: default
#
# Copyright (C) 2014 Arthur Santos
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "base"

%w(openjdk-7-jre unzip keychain).each do |pkg|
  package pkg do
    action :install
  end
end