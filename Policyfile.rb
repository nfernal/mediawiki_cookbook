# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "mediawiki_cookbook"
default_source :supermarket
cookbook "mediawiki_cookbook", path: "."

# run_list: chef-client will run these recipes in the order specified.
run_list "mediawiki_cookbook::default"

named_run_list 'mediawiki', %w(
  mediawiki_cookbook::default
  mediawiki_cookbook::nginx
  mediawiki_cookbook::php_sclo
  mediawiki_cookbook::mediawiki
)
