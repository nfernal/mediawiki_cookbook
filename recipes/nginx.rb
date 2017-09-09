#
# Cookbook:: mediawiki_cookbook
# Recipe:: nginx
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'nginx' do
  action :install
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:start, :enable]
end

node['nginx']['config_files'].each do |fn|
  template fn.to_s do
    source "#{File.basename(fn)}.erb"
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0644'
    notifies :restart, 'service[nginx]', :delayed
  end
end
