default['php']['config_files'] = %w(
  /etc/opt/rh/rh-php56/php.ini
  /etc/opt/rh/rh-php56/php-fpm.d/www.conf
)

default['php']['packages'] = %w(
  rh-php56-php-fpm.x86_64
  rh-php56-php-mysqlnd.x86_64
  sclo-php56-php-pecl-apcu.x86_64
  rh-php56-php-intl.x86_64
  rh-php56-php-xml.x86_64
  rh-php56-php-mbstring.x86_64
)
