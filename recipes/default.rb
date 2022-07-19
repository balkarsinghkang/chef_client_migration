#
# Cookbook:: chef_client_migration
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chef_client_migration::migrate'
include_recipe 'chef-client::cron'
