def CreatePipelineJob(Map params) {
  String name = params.name
  String repository = params.repository
  String gitBranches = params.getOrDefault('branches', 'master')

  String gitUrl = "https://github.com/aokiji/${repository}"

  pipelineJob(name) {
    definition {
      cpsScm {
        scm {
          git {
            remote { url(gitUrl) }
            branches(gitBranches)
            extensions {}
          }
        }
      }
    }
  }
}

CreatePipelineJob(name: 'example', repository: 'jenkins-casc-poc-project')
CreatePipelineJob(name: 'example-2', repository: 'jenkins-casc-poc-project', branches: 'example-branch')
