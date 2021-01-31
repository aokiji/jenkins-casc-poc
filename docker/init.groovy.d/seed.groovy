job = hudson.model.Hudson.instance.getJob("seed")
println "Running seed job: " + job.getFullName()
job.scheduleBuild()
