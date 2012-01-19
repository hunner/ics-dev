define services::service (
  $ensure = 'present',
  $port,
  $protos = ['tcp','udp'],
  $aliases = "",
  $comment = ""
) {
  file {"${services::basedir}/services.d/${port}-${name}":
    ensure  => $ensure,
    content => template('services/service.erb'),
    notify  => Exec['rebuild-services'],
  }
}
