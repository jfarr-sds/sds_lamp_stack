include_recipe 'git'

user = node['phpapp']['user']
checkout_dir = node["phpapp"]["app"]["checkout_dir"]

if node['phpapp']['environment'] != "development"
	git_key = Chef::EncryptedDataBagItem.load( "private_keys", "git_key" )

	file "/root/.ssh/git_key.pem" do
	  content git_key['private']
	  owner "root"
	  group "root"
	  mode 0600
	end

	template "/root/.ssh/config" do
	  source 'ssh.config.erb'
	  cookbook 'phpapp'
	  mode '0644'
	  owner "root"
	  group "root"
	  variables({
		 :key_file => "/root/.ssh/git_key.pem"
	  })
	end

	# install API source code
	git checkout_dir do
	  repository "git@github.com:sentient-prime/Sentient-Prime-Survey-UI.git"
	  revision "master"
	  action :sync
	  user "root"
	end
end

# link the source to the deployment 
link "/var/vhosts/qa-prime" do
  to node["phpapp"]["app"]["checkout_dir"]
end
