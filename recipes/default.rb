#
# Cookbook:: harbor
# Recipe:: default
#
# Copyright:: 2019, Alex Naumchenko, All Rights Reserved.

docker_service 'default' do
  action [:create, :start]
end

include_recipe 'harbor::compose'

group node['harbor']['group'] do
  append true
end

user node['harbor']['user'] do
  gid node['harbor']['group']
  shell '/bin/bash'
  home node['harbor']['path']
  system true
  action :create
end

directory node['harbor']['path'] do
  action :create
  owner node['harbor']['user']
  group node['harbor']['group']
  recursive true
end

sudo node['harbor']['user'] do
  users node['harbor']['user']
  nopasswd true
  groups 'docker, harbor'
end

execute "Download harbor online installer" do
  cwd node['harbor']['path']
  user  node['harbor']['user']
  group node['harbor']['group']
  command <<-EOF
      wget https://storage.googleapis.com/harbor-releases/release-#{node['harbor']['version']}/harbor-online-installer-v#{node['harbor']['version']}.tgz;
      tar -xf harbor-online-installer-v#{node['harbor']['version']}.tgz --strip-components 1
    EOF
    not_if { ::File.exists?("#{node['harbor']['path']}/harbor-online-installer-v#{node['harbor']['version']}.tgz") }
end

template "#{node['harbor']['path']}/harbor.yml" do
  user  node['harbor']['user']
  group node['harbor']['group']
  source "harbor.yml.erb"
  mode "0644"
end

execute "Install harbor" do
  user  node['harbor']['user']
  group node['harbor']['group']
  cwd node['harbor']['path']
  command <<-EOF
      sudo #{node['harbor']['path']}/install.sh
    EOF
    not_if { ::File.exists?("#{node['harbor']['path']}/common/config/core/app.conf") }
end
