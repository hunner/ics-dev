Puppet::Type.type(:rcsrepo).provide(:git) do
  desc 'Git provider for the rcsrepo type. Able to clone, set a revision, or delete a repo.'
  commands :git => 'git'
  def exists?
    File.exist?(File.join(resource[:path], '.git'))
  end
end
