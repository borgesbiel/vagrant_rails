name             'rails-base'
maintainer       'Arthur Santos'
maintainer_email 'arthur.luiz@gmail.com'
license          'All rights reserved'
description      'Setup basic requirements for Rails development environment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'ruby_install'
depends 'chruby'
depends 'postgresql-base'
depends 'nodejs-base'