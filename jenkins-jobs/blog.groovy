#!/usr/bin/env groovy

pipelineJob('blog') {
    displayName('builds for my blog')

    logRotator {
        numToKeep(10)
        daysToKeep(30)
    }

    configure { project ->
        project / 'properties' / 'org.jenkinsci.plugins.workflow.job.properties.DurabilityHintJobProperty' {
            hint('PERFORMANCE_OPTIMIZED')
        }
    }

    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/CaffeinatedOpe/blog')
                    }
                    branches('*/master')
                }
            }
            scriptPath('ci/Jenkinsfile')
        }
    }
}