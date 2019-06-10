#
# Cookbook:: harbor
# Recipe:: compose
#
# Copyright:: 2019, Alex Naumchenko, All Rights Reserved.

execute "Download and install Docker-compose" do
  command <<-EOF
      sudo curl -L "https://github.com/docker/compose/releases/download/#{node['harbor']['docker_compose_version']}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    EOF
  not_if { ::File.exists?("/usr/local/bin/docker-compose") }
end
