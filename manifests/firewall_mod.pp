class windows_firewall {
  windows_firewall::exception { 'Block RDP-In traffic':
    ensure       => 'present',
    direction    => 'in',
    action       => 'deny',
    enabled      => 'true',
    local_port   => '3389',
    protocol     => 'TCP',
    description  => 'Blocks RDP inbound traffic',
  }
}