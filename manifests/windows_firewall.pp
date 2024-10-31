class windows_firewall {
  windows_firewall::exception { 'Allow inbound  on port 8080':
    ensure       => 'present',
    direction    => 'in',
    action       => 'allow',
    enabled      => 'true',
    local_port   => '3389',
    protocol     => 'TCP',
    description  => 'Allows inbound traffic on port 3389',
  }
}
