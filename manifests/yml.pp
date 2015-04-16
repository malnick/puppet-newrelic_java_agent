define newrelic_java_agent::yml (
    $service_env            = undef,
    $license_key,
    $enabled                = true,
    $app_name               = $name,
    $agent_type             = 'java',
    $loglevel               = 'info',
    $audit_mode             = true,
    $log_file_count         = '1',
    $log_limit_in_kbytes    = '0',
    $log_daily              = true,
    $logfile                = "newrelic_agent",
    $daemon_ssl             = false,
    $logfile_path           = false, # default to instal dir
){

    file { "/opt/newrelic/java/${name}.yml":
        content => template('newrelic_java_agent/newrelic.yml.erb'),
        mode    => '0644',
        owner   => 'newrelic',
        group   => 'newrelic',
    }

}
