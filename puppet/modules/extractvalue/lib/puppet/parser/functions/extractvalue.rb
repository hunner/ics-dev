require 'yaml'
Puppet::Parser::Functions.newfunction(:extractvalue, :type => ) do |args|
  raise Puppet::Error if args.length != 2
  data = YAML.load_file(args[0])
  data[args[1]]
end
