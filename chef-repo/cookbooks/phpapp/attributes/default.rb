default["phpapp"]["user"] = 'vagrant'
default['phpapp']['environment'] = "qa"

default["phpapp"]["app"]["checkout_dir"] = "/home/" + default["phpapp"]["user"] + "/chef-repo/Sentient-Prime-Survey-UI/"

node.default['apache']['prefork']['startservers'] = '5'
node.default['apache']['prefork']['minspareservers'] = '5'
node.default['apache']['prefork']['maxspareservers'] = '10'
node.default['apache']['prefork']['maxrequestworkers'] = '150'
node.default['apache']['prefork']['maxconnectionsperchild'] = '0'

node.default['apache']['worker']['startservers'] = '2'
node.default['apache']['worker']['minsparethreads'] = '25'
node.default['apache']['worker']['maxsparethreads'] = '75'
node.default['apache']['worker']['threadlimit'] = '64'
node.default['apache']['worker']['threadsperchild'] = '25'
node.default['apache']['worker']['maxrequestworkers'] = '150'
node.default['apache']['worker']['maxconnectionsperchild'] = '0'

node.default['apache']['event']['startservers'] = '2'
node.default['apache']['event']['minsparethreads'] = '25'
node.default['apache']['event']['maxsparethreads'] = '75'
node.default['apache']['event']['threadlimit'] = '64'
node.default['apache']['event']['threadsperchild'] = '25'
node.default['apache']['event']['maxrequestworkers'] = '150'
node.default['apache']['event']['maxconnectionsperchild'] = '0'