Vagrant.configure(2) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.network "forwarded_port", guest: 6379, host: 6379, protocol: "tcp",
    auto_correct: true
  config.vm.network "forwarded_port", guest: 6379, host: 6379, protocol: "udp",
    auto_correct: true
  config.vm.box = "bento/ubuntu-14.04"
  $get_app = "cd /vagrant; bash build_app.sh"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.json = {
      "getninjas_logstash" => {
        "instance_default" => {
          "elasticsearch_ip" => "'search-getninjas-r74hrslc4sj6d35ksw76npl3iu.us-west-2.es.amazonaws.com'",
          "elasticsearch_port" => "80",
          "elasticsearch_embedded" => false,
          "redis_ip" => "'127.0.0.1'"
        }
      },
      "beaver" => {
        "configuration": {
              "logstash_version": "1",
              "transport": "redis",
              "redis_url": "redis://127.0.0.1:6379/0",
              "redis_namespace": "beaver:logstash"
        },
        "files": [
            {
                "path": "/vagrant/getninjas_app_sample/log/app.log",
                "add_field": "system,get_ninjas,env,prod,type,api,team,devops,appfilter,getninjas"
            }
        ]
      }
    }
    chef.add_recipe "getninjas_logstash"
    chef.add_recipe "beaver"
  end
  config.vm.provision "shell", inline: $get_app
  config.vm.provision "docker" do |d|
    d.run "nullck/getninjas_app_sample",
      cmd: "/bin/sh -c 'while true; do /usr/local/bin/node app.js; sleep 10; done'",
      args: "-v '/vagrant/getninjas_app_sample/log:/var/log'"
  end
end