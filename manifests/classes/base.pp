class sudo::base {
  $admin_group = 'admin' # must change this for non-ubuntu.  I'd stick a case statement if I didn't hate them so mucn
  package {"sudo":
    ensure => installed,
  }

  file {"/etc/sudoers":
    ensure => present,
    content => template('sudo/sudoers.erb'),
    owner  => root,
    group  => root,
    mode   => 440,
    require => Package["sudo"];
  }
}
