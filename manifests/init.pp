class newrelic_java_agent {

    class { ::newrelic_java_agent::install: before => Class[::newrelic_java_agent::agent] }
    class { ::newrelic_java_agent::agent:}

}
    
