default["phpapp"]["user"] = 'vagrant'
default['phpapp']['environment'] = "qa"

default["phpapp"]["app"]["checkout_dir"] = "/home/" + default["phpapp"]["user"] + "/chef-repo/Sentient-Prime-Survey-UI/"

node.default['apache']['user'] = 'www-data'
node.default['apache']['group'] = 'www-data'

node.default['apache']['event']['startservers'] = '2'
node.default['apache']['event']['minsparethreads'] = '25'
node.default['apache']['event']['maxsparethreads'] = '75'
node.default['apache']['event']['threadlimit'] = '64'
node.default['apache']['event']['threadsperchild'] = '25'
node.default['apache']['event']['maxrequestworkers'] = '150'
node.default['apache']['event']['maxconnectionsperchild'] = '0'