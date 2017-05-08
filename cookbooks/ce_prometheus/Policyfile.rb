# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "ce_prometheus"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "ce_prometheus::default"

# Specify a custom source for a single cookbook:
cookbook "ce_prometheus", path: "."
cookbook "prometheus", git: "https://github.com/thommay/chef-prometheus", branch: "tm/native_accumulators"
