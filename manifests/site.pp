## site.pp ##

# This file (./manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
# https://puppet.com/docs/puppet/latest/dirs_manifest.html
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition if you want to use it.

## Active Configurations ##

# Disable filebucket by default for all File resources:
# https://github.com/puppetlabs/docs-archive/blob/master/pe/2015.3/release_notes.markdown#filebucket-resource-no-longer-created-by-default
File { backup => false }

## Node Definitions ##

# The default node definition matches any node lacking a more specific node
# definition. If there are no other node definitions in this file, classes
# and resources declared in the default node definition will be included in
# every node's catalog.
#
# Note that node definitions in this file are merged with node data from the
# Puppet Enterprise console and External Node Classifiers (ENC's).
#
# For more on node definitions, see: https://puppet.com/docs/puppet/latest/lang_node_definitions.html
node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  class { 'pe_repo::platform::windows_x86_64': }
  
}

node 'ec2amaz-bqigu4j.us-east-2.compute.internal' {
  include windows_firewall

   windows_firewall::exception { 'Allow inbound traffic on port 3389':
    ensure       => 'present',
    direction    => 'in',
    action       => 'allow',
    protocol     => 'TCP',
    local_port   => 3389,
    remote_port  => 'any',
    display_name => 'Allow inbound Remote Desktop traffic on port 3389',
    description  => 'Allows inbound Remote Desktop traffic on port 3389',
  }
}
node 'ip-172-31-15-101.us-east-2.compute.internal' {
  package { 'pe-java17': 
    ensure => 'present',
    source => '',
    provider => 'rpm',
  }
}

