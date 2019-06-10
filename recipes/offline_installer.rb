#
# Cookbook:: harbor
# Recipe:: offline_installer
#
# Copyright:: 2019, Alex Naumchenko, All Rights Reserved.

execute "Download harbor offline installer" do
  cwd node['harbor']['path']
  command <<-EOF
      wget https://storage.googleapis.com/harbor-releases/release-#{node['harbor']['version']}/harbor-offline-installer-v#{node['harbor']['version']}.tgz;
      tar -xf harbor-offline-installer-v#{node['harbor']['version']}.tgz --strip-components 1
    EOF
    only_if { node['harbor']['offline_installer'] }
end
