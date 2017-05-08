# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "prometheus"

# Where to find external cookbooks:
default_source :chef_repo, ".." do |s|
  s.preferred_for "base", "ce_prometheus"
end
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "base::default", "ce_prometheus::default"

cookbook "prometheus", git: "https://github.com/thommay/chef-prometheus", branch: "tm/native_accumulators"
# Specify a custom source for a single cookbook:
# cookbook "example_cookbook", path: "../cookbooks/example_cookbook"

default["prometheus"]["version"] = '1.6.1'
default['prometheus']['checksum'] = '07f466ad23848c7dd740e722355d25ae1d24584d6574a8f10542d1da13368d2f'
