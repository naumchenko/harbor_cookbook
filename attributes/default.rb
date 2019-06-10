default['harbor']['path'] = "/opt/harbor"
default['harbor']['user'] = "harbor"
default['harbor']['group'] = "harbor"
default['harbor']['version'] = '1.8.0'
default['harbor']['docker_version'] = '18.09.0'
default['harbor']['docker_compose_version'] = '1.18.0'


default['harbor']['build_from_sources'] = false
default['harbor']['offline_installer'] = false
default['harbor']['notary'] = false

default['harbor']['https'] = '443'
default['harbor']['http'] = '80'
default['harbor']['hostname'] = '33.33.33.77'
default['harbor']['data_volume'] = "#{node['harbor']['path']}/data"

default['harbor']['harbor_admin_password'] = 'Harbor12345'
default['harbor']['database'] = ''
default['harbor']['database_root_password'] = 'root123'
default['harbor']['jobservice'] = ''
default['harbor']['jobservice_max_job_workers'] = ''

default['harbor']['log'] = ''
default['harbor']['log_level'] = ''
default['harbor']['log_rotate_count'] = ''
default['harbor']['log_log_rotate_size'] = ''
default['harbor']['log_location'] = ''

# Database Settings
default['harbor']['db_type'] = "mysql"
default['harbor']['db_host'] = "localhost"
default['harbor']['db_name'] = "harbor"
default['harbor']['db_user'] = "root"
default['harbor']['db_pass'] = "harbor_db_pass"
default['harbor']['db_socket'] = "/var/run/mysql-#{node['harbor']['db_name']}/mysqld.sock"
