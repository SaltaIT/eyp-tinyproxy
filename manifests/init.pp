class tinyproxy (
                  $manage_package        = true,
                  $package_ensure        = 'installed',
                  $manage_service        = true,
                  $manage_docker_service = true,
                  $service_ensure        = 'running',
                  $service_enable        = true,
                  $port                  = '8888',
                  $listen                = undef,
                  $bind                  = undef,
                ) inherits tinyproxy::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::tinyproxy::install': }
  -> class { '::tinyproxy::config': }
  ~> class { '::tinyproxy::service': }
  -> Class['::tinyproxy']

}
