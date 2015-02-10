class newrelic_java_agent {

    include newrelic_java_agent::install

    user { 'newrelic': ensure  => present,}
    group { 'newrelic': ensure => present,}


}
