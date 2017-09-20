#
# Cookbook:: dcob
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'hab' do
  system true
end

hab_install 'me' do
  action :upgrade
end

hab_sup 'me'

hab_package 'chef_community_engineering/dcob'

hab_service 'chef_community_engineering/dcob' do
  action %i( load start )
  strategy 'at-once'
  service_group node.policy_group
end
