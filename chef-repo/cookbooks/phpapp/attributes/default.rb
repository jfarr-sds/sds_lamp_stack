default["phpapp"]["user"] = 'vagrant'
default['phpapp']['environment'] = "qa"

default["phpapp"]["app"]["checkout_dir"] = "/home/" + default["phpapp"]["user"] + "/chef-repo/Sentient-Prime-Survey-UI/"

default["phpapp"]["database_name"] = 'phpapp'
default["phpapp"]["db_username"] = 'phpapp'

default["phpapp"]['mysql']["initial_root_password"] = 'password'
default["phpapp"]['mysql']["host"] = '127.0.0.1'
default["phpapp"]['mysql']["username"] = 'root'
default["phpapp"]['mysql']["port"] = '3306'
default["phpapp"]['mysql']["socket"] = '/var/run/mysql=default/mysqld.sock'

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