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
include_recipe "apache2::mod_php5"
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
template '/etc/apache2/sites-available/qa-prime.conf' do
  source 'qa-prime.conf.erb'
  cookbook 'phpapp'
  mode '0644'
  owner 'root'
  group 'root'
end

# Enable QA vhost
link "/etc/apache2/sites-enabled/qa-prime.conf" do
  to "/etc/apache2/sites-available/qa-prime.conf" 
end

# link the source to the deployment 
# todo: this is for development only
link "/var/vhosts/qa-prime" do
  to "/home/vagrant/chef-repo/Sentient-Prime-Survey-UI/"
end

