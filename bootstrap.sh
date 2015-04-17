# creates a VM suitable for working with the tutorial here
# http://gettingstartedwithchef.com/first-steps-with-chef.html

# Install Chef
cd /home/vagrant
curl -L https://www.opscode.com/chef/install.sh | bash

# Get resources for creating a project directory structure
if [ ! -d "/home/vagrant/getting_started" ]; then
	mkdir /home/vagrant/getting_started
fi

if [ ! -d "/home/vagrant/getting_started/chef-repo" ]; then
	cd /home/vagrant/getting_started # configured in the Vagrantfile
	wget https://github.com/chef/chef-repo/tarball/master
	tar -zxf master
	mv chef-chef-repo-* chef-repo
	rm master
fi

# Configure knife to be aware of our cookbooks directory

if [ ! -d "/home/vagrant/getting_started/chef-repo/.chef" ]; then
	cd /home/vagrant/getting_started/chef-repo
	mkdir .chef
	echo "cookbook_path [ '/home/vagrant/getting_started/chef-repo/cookbooks' ]" > .chef/knife.rb
fi

# Use knife to create a new cookbook
knife cookbook create phpapp

sudo chef-solo -c /home/vagrant/getting_started/chef-repo/solo.rb -j /home/vagrant/getting_started/chef-repo/web.json