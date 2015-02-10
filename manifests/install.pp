class newrelic_java_agent::install (

    $download       = '"https://download.newrelic.com/newrelic/java-agent/newrelic-agent/#{version}/newrelic-agent-#{version}.jar"',
    $version        = '3.9.0',
    $install_dir    = '/opt/newrelic/java'
    $app_user       = 'newrelic',
    $app_group      = 'newrelic',


) {

    $agent_jar      = "/newrelic-agent-${version}.jar"

    $dirs = ['/opt/newrelic','/opt/newrelic/java']
    file { $dirs:
        ensure => directory,
        owner  => $appuser,
        group  => $appuser,
    }

    httpfile { $install_dir:
        source => $download,
    }

    exec { 'newrelic_install':
        command => "/usr/share/java -jar ${install_dir}/newrelic.jar -s ${install_dir} install",
        require => Httpfile[$install_dir],
    }
}