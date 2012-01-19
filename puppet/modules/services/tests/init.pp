include services
services::service { 'nicname':
  port    => '43',
  aliases => 'whois',
}
services::service { 'tacacs':
  port    => '49',
  protos  => ['tcp'],
  comment => 'Login Host Protocol (TACACS)',
}
services::service { 'domain':
  port   => '53',
}
