# creates a VM suitable for working with the tutorial here
# http://gettingstartedwithchef.com/first-steps-with-chef.html

# Install Chef
cd /home/vagrant
curl -L https://www.opscode.com/chef/install.sh | bash

# Get resources for creating a project directory structure
mkdir /home/vagrant/getting_started
cd /home/vagrant/getting_started # configured in the Vagrantfile
wget http://github.com/opscode/chef-repo/tarball/master
tar -zxf master
mv chef-chef-repo-* chef-repo
rm master

# Configure knife to be aware of our cookbooks directory
cd chef-repo
mkdir .chef
echo "cookbook_path [ '/home/vagrant/getting_started/chef-repo/cookbooks' ]" > .chef/knife.rb

# Use knife to create a new cookbook
knife cookbook create phpapp