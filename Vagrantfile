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
          "elasticsearch_ip" => "73f359f87e7e0e03196ed2812c7feb9b.us-east-1.aws.found.io",
          "elasticsearch_port" => "9200",
          "elasticsearch_embedded" => false,
          "redis_ip" => ""
        }
      }
    }
    chef.add_recipe "getninjas_logstash"
  end
  config.vm.provision "shell", inline: $get_app
  config.vm.provision "docker" do |d|
    d.run "nullck/getninjas_app_sample",
      cmd: "/bin/sh -c 'while true; do /usr/local/bin/node app.js; sleep 10; done'",
      args: "-v '/vagrant/getninjas_app_sample/log:/var/log'"
  end
end