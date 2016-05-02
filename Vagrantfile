Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.json = {
      "getninjas_logstash" => {
        "instance_default" => {
          "elasticsearch_ip" => "73f359f87e7e0e03196ed2812c7feb9b.us-east-1.aws.found.io",
          "elasticsearch_port" => "9200",
          "elasticsearch_embedded" => false,
          "redis_ip" => "127.0.0.1"
        }
      }
    }
    chef.add_recipe "getninjas_logstash"
  end
end