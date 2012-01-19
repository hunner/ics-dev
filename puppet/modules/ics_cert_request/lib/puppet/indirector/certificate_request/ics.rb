require 'puppet/indirector/ssl_file'
require 'puppet/ssl/certificate_request'

class Puppet::SSL::CertificateRequest::Ics < Puppet::SSL::CertificateRequest::Ca
  def save(request)

    # query cmdb here
    result = super
    result
  end
end
