describe docker.version do
  its('Server.Version') { should cmp >= '18.09.6'}
  its('Client.Version') { should cmp >= '18.09.6'}
end


describe docker_container(name: 'nginx') do
  its('ports') { should eq '0.0.0.0:80->80/tcp' }
end

describe docker_container(name: 'harbor-db') do
  its('ports') { should eq '5432/tcp' }
end

describe docker_container(name: 'redis') do
  its('ports') { should eq '6379/tcp' }
end

%w(nginx harbor-jobservice harbor-portal harbor-core redis registry registryctl harbor-db harbor-log).each do |container|
    describe docker_container(container) do
      it { should exist }
      it { should be_running }
    end
end
