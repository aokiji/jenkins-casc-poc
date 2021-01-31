pipelineJob('example') {
  definition {
    cpsScm {
      scm {
        git{
          remote {
            url('https://github.com/aokiji/jenkins-casc-poc-project.git')
          }
          branches('master')
            extensions { }
        }
      }
    }
  }
}
