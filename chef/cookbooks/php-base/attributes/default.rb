node.normal['php']['conf_dir'] = '/etc/php5/apache2'
node.normal['php']['packages'] = %w(php5-tidy php5-imagick php5-xdebug 
  php5-geoip php5-mcrypt php5-memcache php5-memcached)

node.normal['php']['ini']['cookbook'] = 'php-base'
node.normal['apache']['user'] = 'vagrant'
node.normal['apache']['group'] = 'vagrant'

node.normal['apache']['prefork']['startservers']       = 10
node.normal['apache']['prefork']['minspareservers']    = 10
node.normal['apache']['prefork']['maxspareservers']    = 30
node.normal['apache']['prefork']['serverlimit']      = 400
node.normal['apache']['prefork']['maxclients']       = 400
node.normal['apache']['prefork']['maxrequestsperchild']  = 1000

node.normal['apache']['worker']['startservers']      = 4
node.normal['apache']['worker']['maxclients']        = 1024
node.normal['apache']['worker']['serverlimit']       = 16
node.normal['apache']['worker']['minsparethreads']     = 64
node.normal['apache']['worker']['maxsparethreads']     = 128
node.normal['apache']['worker']['threadsperchild']     = 64
node.normal['apache']['worker']['maxrequestsperchild']   = 0