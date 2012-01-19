Puppet::Type.type(:rcsrepo).provide(:git) do
  desc 'Git provider for the rcsrepo type. Able to clone, set a revision, or delete a repo.'
  commands :git => 'git'
  def exists?
    File.exist?(File.join(resource[:path], '.git'))
  end
  def create
    if resource[:source]
      git('clone', resource[:source], resource[:path])
    else
      git('init', resource[:path])
    end
    self.revision = resource[:revision] if resource[:revision]
  end
  def destroy
    FileUtils.rm_rf(resource[:path])
  end
  def revision
    git_helper('rev-parse', 'HEAD', resource[:path]).split[0]
  end
  def revision=(value)
    git_helper('fetch', 'origin')
    git_helper('checkout', value)
  end

  private

  def git_helper(*args)
    git('--work-tree', resource[:path], '--git-dir', File.join(resource[:path], '.git'), *args)
  end
end
