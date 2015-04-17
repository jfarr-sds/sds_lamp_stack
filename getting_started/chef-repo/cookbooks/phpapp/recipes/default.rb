#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache::mod_php5"

apache_site "default" do
  enable true
end

mysql_service 'default' do
  port '3307' # todo: need to use this port because the "mysql" instance still gets installed on 3306
  version '5.5'
  initial_root_password 'password'
  action [:create, :start]
end

mysql_config 'default' do
  cookbook 'phpapp'
  source 'mysite.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end

mysql_client 'default' do
  action :create
end