#!/usr/bin/env ruby

ports = `netstat -tnl`.collect do |line|
  m = line.match(/:(\d+)\s/)
  Integer(m[1]) if m
end.compact.sort.join(',')

Facter.add('listening_ports') do
  setcode { ports }
end
