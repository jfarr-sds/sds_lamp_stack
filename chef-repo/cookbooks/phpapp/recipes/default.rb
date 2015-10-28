#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# enable multiverse so we can get libapache2-mod-fastcgi
apt_repository 'archive-ubuntu-multiverse' do
  uri        'http://archive.ubuntu.com/ubuntu'
  distribution 'trusty'
  components ['multiverse']
  deb_src 'true'
end

include_recipe "apache2"
include_recipe "php"
include_recipe "php5-fpm::install"
include_recipe "apache2::mod_fastcgi"
include_recipe "apache2::mod_speling"
include_recipe "apache2::mod_proxy"


apache_site "default" do
  enable true
end

# create vhosts dir
directory "/var/vhosts" do
  owner node['apache2']['user']
  group node['apache2']['group']
  mode '0755'
  action :create
end

# add vhost config for QA
template '/etc/apache2/sites-available/prime.conf' do
  source 'prime.conf.erb'
  cookbook 'phpapp'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/etc/apache2/conf-available/php5-fpm.conf' do
  source 'php5-fpm.conf.erb'
  cookbook 'phpapp'
  mode '0644'
  owner 'root'
  group 'root'
end

apache_module 'actions' do
  enable true
end

apache_module 'fastcgi' do
  enable true
end

apache_module 'alias' do
  enable true
end

apache_conf 'php5-fpm' do
  enable true
end


# Enable QA vhost
link "/etc/apache2/sites-enabled/prime.conf" do
  to "/etc/apache2/sites-available/prime.conf" 
end

