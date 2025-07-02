# File: 100-puppet_ssh_config.pp

class ssh_client_config {

  # Ensure Host * block exists
  file_line { 'Host star':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => 'Host *',
  }

  # Disable password authentication under Host *
  file_line { 'Turn off passwd auth':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '    PasswordAuthentication no',
    match  => '^Host \*',
  }

  # Set identity file under Host *
  file_line { 'Declare identity file':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '    IdentityFile ~/.ssh/school',
    match  => '^Host \*',
  }
}

include ssh_client_config
