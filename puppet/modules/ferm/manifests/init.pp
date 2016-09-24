class ferm {
        package { "ferm":
                ensure => installed,
        }

	file { "/etc/ferm/ferm.conf":
		content => template("puppet:///modules/ferm/template/ferm.conf.erb"),
	exec {"ferm-reload":
		command => '/etc/init.d/ferm reload',
		require => Package["ferm"],
		subscribe => File["/etc/ferm/ferm.conf"],
		refreshonly => True
	}
}
