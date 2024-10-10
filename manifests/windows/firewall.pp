class windowsFirewall {
  windows_firewall_rule { 'Block RDP-In traffic':
    ensure       => 'present',
    direction    => 'in',
    action       => 'block',
    enabled      => 'true',
    local_port   => '3389',
    protocol     => 'TCP',
    description  => 'Blocks RDP inbound traffic',
  }
}