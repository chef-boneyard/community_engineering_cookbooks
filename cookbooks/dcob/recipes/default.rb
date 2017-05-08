#
# Cookbook:: dcob
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'hab' do
  system true
end
hab_install 'me'

hab_package 'chef_community_engineering/dcob'

hab_sup 'me'

hab_service 'chef_community_engineering/dcob' do
  action %i( load start )
  strategy 'rolling'
  config_from '/var/habitat/configs'
end
