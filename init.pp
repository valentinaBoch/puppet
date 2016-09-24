class ferm {
        package { "ferm":
                ensure => installed,
        }

	file { "/etc/ferm/ferm.conf":
		require => Package["ferm"],
		source => "puppet:///modules/ferm/files/debian",
		source_permissions => ignore,
		require => File["/etc/ferm/ferm.conf"] 		
	}

}
