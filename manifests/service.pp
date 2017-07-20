class tinyproxy::service inherits tinyproxy {

  #
  validate_bool($tinyproxy::manage_docker_service)
  validate_bool($tinyproxy::manage_service)
  validate_bool($tinyproxy::service_enable)

  validate_re($tinyproxy::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${tinyproxy::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $tinyproxy::manage_docker_service)
  {
    if($tinyproxy::manage_service)
    {
      service { $tinyproxy::params::service_name:
        ensure => $tinyproxy::service_ensure,
        enable => $tinyproxy::service_enable,
      }
    }
  }
}
