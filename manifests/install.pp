class tinyproxy::install inherits tinyproxy {

  if($tinyproxy::manage_package)
  {
    package { $tinyproxy::params::package_name:
      ensure => $tinyproxy::package_ensure,
    }
  }

}
