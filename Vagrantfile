Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.json = {
      "getninjas_logstash" => {
        "instance_default" => {
          "elasticsearch_ip" => "",
          "elasticsearch_port" => "",
          "elasticsearch_embedded" => false
        }
      }
    }
    chef.add_recipe "getninjas_logstash"
  end
end