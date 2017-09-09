#
# Cookbook:: mediawiki_cookbook
# Recipe:: php_sclo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

raise 'Not implemented for platform' unless node['platform'] == 'centos'
raise 'Not implemented for platform version' unless node['platform_version'].to_i == 6

package 'centos-release-scl' do
  action :install
end

node['php']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

ruby_block 'Rename scl_php init.d to php-fpm' do
  block do
    ::File.rename('/etc/init.d/rh-php56-php-fpm', '/etc/init.d/php-fpm')
  end
  only_if { ::File.exist?('/etc/init.d/rh-php56-php-fpm') }
end

service 'php-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

node['php']['config_files'].each do |fn|
  template fn.to_s do
    source "#{File.basename(fn)}.erb"
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0644'
    notifies :restart, 'service[nginx]', :delayed
  end
end
