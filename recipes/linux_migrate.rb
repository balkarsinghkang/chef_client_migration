#
# Cookbook:: chef_client_migration
# Recipe:: migration
#
# Copyright:: 2020, The Authors, All Rights Reserved.

cookbook_file '/etc/chef/validation.pem' do
  source 'validation.pem'
  owner 'root'
  group 'root'
  mode  '600'
end

execute 'move_those_files' do
  command '/usr/local/bin/move_old_files'
  action :nothing
end

cookbook_file '/usr/local/bin/move_old_files' do
  source 'move_old_files'
  action :create
  owner  'root'
  group  'root'
  mode   '700'
  notifies :run, 'execute[move_those_files]', :immediately
end

template '/etc/chef/client.rb' do
  source 'client_rb.erb'
  mode '644'
  owner 'root'
  group 'root'
  # notifies :run, 'execute[chef-client]', :delayed
end

