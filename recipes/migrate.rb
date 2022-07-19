#
# Cookbook:: chef_client_migration
# Recipe:: migration
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# directory node['chef_client_migration']['default_chef_path'] do
#   action :create
#   notifies :create, 'template[client_rb]', :immediately
#   notifies :create, 'cookbook_file[validation_pem]', :immediately
# end

# TODO: Add some intelligence for handling failures

execute 'move_files_cmd' do
  command node['chef_client_migration']['move_files_script']
  action :nothing
end

cookbook_file node['chef_client_migration']['move_files_script'] do
  source node['chef_client_migration']['move_files_cmd']
  mode '0700'
  action :create
  notifies :run, 'execute[move_files_cmd]', :immediately
end

# template node['chef_client_migration']['client_rb'] do
template 'client_rb' do
  path   node['chef_client_migration']['client_rb']
  source node['chef_client_migration']['client_rb_template']
  #   action :nothing
end

cookbook_file 'validation_pem' do
  path   node['chef_client_migration']['validation_pem_location']
  source 'validation.pem'
  # action :nothing
end

chef_client_cron 'Chef Client Cron Job' do
  action :add
  minute node['chef_client']['cron']['minutes']
end