default['nginx']['user'] = 'nginx'
default['nginx']['group'] = 'nginx'
default['nginx']['listen_port'] = 80
default['nginx']['worker_processes'] = 1
default['nginx']['worker_connections'] = 1024
default['nginx']['keepalive_timeout'] = 65
default['nginx']['config_files'] = %w(
  /etc/nginx/nginx.conf
  /etc/nginx/conf.d/default.conf
  /usr/share/nginx/html/info.php
)
