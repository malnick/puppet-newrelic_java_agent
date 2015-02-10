class newrelic_java_agent::install (

    $version        = '3.9.0',
    $install_dir    = '/opt/newrelic',
    $app_user       = 'newrelic',
    $app_group      = 'newrelic',

) {

    $agent_jar      = "/newrelic-agent-${version}.jar"
    $download       = "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/${version}/newrelic-agent-${version}.jar"
    
    file { $install_dir: 
        ensure => directory,
        owner  => $appuser,
        group  => $appuser,
    }

     exec { "wget_agent": 
        command => "/usr/bin/wget -P ${install_dir}/java ${download}", 
        require => File[$install_dir],
    }

    exec { 'newrelic_install':
        command => "/usr/bin/java -jar ${install_dir}/java/newrelic-agent-${version}.jar -s ${install_dir} install",
        require => Exec['wget_agent'],
    }
}
