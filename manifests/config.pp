class tinyproxy::config inherits tinyproxy {

  file { '/etc/tinyproxy/tinyproxy.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/tinyproxyconf.erb"),
  }

}
