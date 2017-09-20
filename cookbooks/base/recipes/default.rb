package 'zsh'

node.default['chef_client']['systemd']['timer'] = true

include_recipe 'chef-client::systemd_service'

chef_client_updater 'stable' do
  channel 'stable'
end

users_manage 'wheel' do
  group_id 2300
  action [:create]
end

node.default['authorization']['sudo']['groups'] = []
node.default['authorization']['sudo']['include_sudoers_d'] = true
node.default['authorization']['sudo']['sudoers_defaults'] = [
  'env_reset',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"',
]

include_recipe 'sudo'

sudo 'wheel' do
  group 'wheel'
  nopasswd true
end
