Puppet::Type.newtype(:rcsrepo) do
  ensurable

  newparam(:path) do
    desc "The checkout path"
    newvalues(/^\//)
    isnamevar
  end
  newparam(:source) do
    desc "The source URL for the repo"
    validate do |value|
      unless value =~ /^(https?|git|svn):\/\// and URI.parse(value)
        raise ArgumentError, "Source is not an http(s), git, or svn URL: #{value}"
      end
    end
    munge do |value|
      value = URI.parse(value)
      case value.scheme
      when /^git/
        #resource[:provider] = :git
      when /^svn/
        #resource[:provider] = :svn
      end
      value
    end
  end
  newproperty(:revision) do
    desc "The revision which the repo should have checked out"
    newvalues(/^\S+$/)
  end
end
