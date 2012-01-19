#!/usr/bin/env ruby

#output = %x{yum list installed}
#output.each do |line|
#  #inside a loop...
#  #Code here...
#  package = 'zip'
#  version = '2.31-2.el5'
#
#  Facter.add("yum_#{package}_version") do
#    setcode { version }
#  end
#end


#  line = line.split
#  p line
#end

`yum list installed`.each do |line|
  m = line.match(/^(\w+)\.\w+\s+(\S+)/)
  if m
    Facter.add("yum_#{m[1]}_version") do
      confine :has_yum => 'true'
      setcode { m[2] }
    end
  end
end
