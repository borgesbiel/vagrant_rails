node.normal['postgresql']['password']['postgres'] = '849003'
node.normal['postgresql']['config']['listen_addresses'] = '*'
node.normal['postgresql']['config']['datestyle'] = 'iso, dmy'
node.normal['postgresql']['config']['default_text_search_config'] = 'pg_catalog.portuguese'
node.default['postgresql']['server']['encoding'] = "UTF8"
node.default['postgresql']['server']['locale'] = "pt_BR.utf8"

node.normal['postgresql']['config']['timezone'] = 'Brazil/East'

node.normal['postgresql']['pg_hba'] = [
  {:type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'ident'},
  {:type => 'local', :db => 'all', :user => 'all', :addr => nil, :method => 'md5'},
  {:type => 'host', :db => 'all', :user => 'all', :addr => '0.0.0.0/0', :method => 'md5'},
  {:type => 'host', :db => 'all', :user => 'all', :addr => '::1/128', :method => 'md5'}
]