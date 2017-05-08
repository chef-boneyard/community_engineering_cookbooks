package 'zsh'

node.default['chef_client']['systemd']['timer'] = true

include_recipe 'chef-client::systemd_service'

chef_client_updater 'current' do
  channel 'current'
  version '13.1.6'
end

users_manage 'wheel' do
  group_id 2300
  action [:create]
end
