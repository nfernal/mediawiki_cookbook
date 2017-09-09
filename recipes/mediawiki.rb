#
# Cookbook:: mediawiki_cookbook
# Recipe:: mediawiki
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory '/var/www/mediawiki' do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
  recursive true
end

log 'mw_message' do
  message "Downloading mediawiki version: #{node['mediawiki']['full_version']}"
  level :info
end

remote_file "/tmp/mediawiki-#{node['mediawiki']['full_version']}.tar.gz" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0644'
  source node['mediawiki']['url']
  # checksum 'sha256checksum'
end

execute 'untar_media_wik' do
  cwd '/tmp'
  command "tar xzvf mediawiki-#{node['mediawiki']['full_version']}.tar.gz -C /var/www/mediawiki --strip-components 1"
  not_if { File.directory?("/var/www/mediawiki-node['mediawiki']['full_version']}/RELEASE-NOTES-#{node['mediawiki']['minor_version']}") }
end

# ruby_block 'Rename mediawiki directory' do
#   block do
#     File.rename("/var/www/mediawiki-#{node['mediawiki']['full_version']}", "node['mediawiki']['base_directory']")
#     only_if { File.directory?('/var/www/mediawiki') }
#   end
# end
