default['mediawiki']['base_url'] = 'https://releases.wikimedia.org'
default['mediawiki']['full_version'] = '1.29.1'
default['mediawiki']['minor_version'] = "#{node['mediawiki']['full_version'].split('.')[0..1].join('.')}"
default['mediawiki']['url'] = "#{node['mediawiki']['base_url']}/mediawiki/#{node['mediawiki']['minor_version']}/mediawiki-#{node['mediawiki']['full_version']}.tar.gz"
default['mediawiki']['db_creds'] = {'username' => 'mediawiki_master', 'password' => '&6brWWFlX1EhgP*%'}
default['mediawiki']['base_directory'] = '/var/www/mediawiki'
