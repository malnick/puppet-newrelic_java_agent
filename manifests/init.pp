class newrelic_java_agent (
    $license_key,   
){

    class { ::newrelic_java_agent::install: }#before => Class[::newrelic_java_agent::agent] }
    #class { ::newrelic_java_agent::agent:}

}
    
