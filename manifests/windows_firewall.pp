class windows_firewall {
  windows_firewall_rule { 'Allow inbound traffic on port 8080':
    ensure       => 'present',
    direction    => 'in',
    action       => 'block',
    enabled      => 'true',
    local_port   => '8080',
    protocol     => 'TCP',
    description  => 'Allows inbound traffic on port 8080',
  }
}
