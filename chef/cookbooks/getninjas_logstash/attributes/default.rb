default['getninjas_logstash']['instance_default']['elasticsearch_cluster'] = 'logstash'
default['getninjas_logstash']['instance_default']['elasticsearch_ip'] = ''
default['getninjas_logstash']['instance_default']['elasticsearch_port'] = ''
default['getninjas_logstash']['instance_default']['elasticsearch_embedded'] = true


###
default[:logstash_scup][:curator] == false
default[:logstash_scup][:repository] = "git@bitbucket.org:scup/logstash-configs.git"%
