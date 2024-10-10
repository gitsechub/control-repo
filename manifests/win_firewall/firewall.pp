class windowsFirewall {
  windows_firewall_rule { 'Deny RDP-In to server':
    ensure       => 'present',
    direction    => 'in',
    action       => 'block',
    enabled      => 'true',
    local_port   => '3389',
    protocol     => 'TCP',
    description  => 'Blocks inbound RDP',
  }
}
