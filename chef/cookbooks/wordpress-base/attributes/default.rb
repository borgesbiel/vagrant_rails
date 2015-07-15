#
# Author:: Arthur Santos (<arthur@bluevox.com.br>)
#
# Cookbook Name:: wordpress-base
# Attributes:: default
#
default_password = '849003'

node.default['wordpress']['web_app'] = [
  {
    :server_port => 80,
    :name => node['fqdn'],
    :server_name => node['fqdn'],
    :server_aliases => [node['fqdn']],
    :docroot => "/var/www/wordpress",
    :allow_override => "FileInfo Options Indexes",
    :directory_index => []
  }
]

node.default['mysql']['server_debian_password'] = default_password
node.default['mysql']['server_root_password'] = default_password
node.default['mysql']['server_repl_password'] = default_password

node.default['wordpress']['parent_dir'] = "/var/www"
node.default['wordpress']['dir'] = "#{node['wordpress']['parent_dir']}/wordpress"
node.default['wordpress']['url'] = 'http://br.wordpress.org/latest-pt_BR.tar.gz'
node.default['wordpress']['languages']['lang'] = 'pt_BR'
node.default['wordpress']['server_aliases'] = [node['fqdn'], 'wp.dev']