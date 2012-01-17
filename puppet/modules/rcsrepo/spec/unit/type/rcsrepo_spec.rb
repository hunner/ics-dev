require 'puppet'
require 'puppet/type/rcsrepo'
describe Puppet::Type.type(:rcsrepo) do
  before :each do
    @rcsrepo = Puppet::Type.type(:rcsrepo).new(:path => '/foo')
  end
  it 'should accept ensure' do
    @rcsrepo[:ensure] = "present"
  end
  it 'should require that path be absolute' do
    expect { @rcsrepo[:path] = 'not/absolute' }.should raise_error Puppet::Error, /Parameter path failed: Invalid value/
  end
  it 'should not accept whitespace in a revision' do
    expect { @rcsrepo[:revision] = 'white space' }.should raise_error
  end
  it 'should accept a valid source URI' do
    @rcsrepo[:source] = 'git://github.com/foo/bar'
  end
  it 'should not accept an invalid source URI' do
    expect { @rcsrepo[:source] = 'git://github.com/foo/日本人' }.should raise_error
    expect { @rcsrepo[:source] = 'github.com/foo/bar' }.should raise_error Puppet::Error
  end
end
