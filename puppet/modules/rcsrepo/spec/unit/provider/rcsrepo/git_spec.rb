require 'puppet'
require 'fileutils'
require 'mocha'
RSpec.configure do |config|
    config.mock_with :mocha
end
provider_class = Puppet::Type.type(:rcsrepo).provider(:git)
describe provider_class do
  before :each do
    @test_dir = File.join('/tmp', Time.now.to_i.to_s, 'repo')
    @resource = Puppet::Type::Rcsrepo.new({:path => @test_dir})
    @provider = provider_class.new(@resource)
  end
  it 'should be able to check if a repo does not exist' do
    @provider.exists?.should == false
  end
  it 'should be able to check if a created repo exists' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.create
    @provider.exists?.should == true
  end
  it 'should be able to verify the destroyed repo unexists' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.create
    @provider.exists?.should == true
    @provider.destroy
    @provider.exists?.should == false
  end
  it 'should be able to get the repo revision'
  it 'should be able to set the repo revision'
  after :each do
    FileUtils.rm_rf(File.dirname(@test_dir))
  end
end
