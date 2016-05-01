# Add Git Wrapper
cookbook_file "/usr/local/bin/wrap-ssh4git.sh" do
    source "wrap-ssh4git.sh"
    owner "deployer"
    group "scupadmin"
    mode 0775
end

#Create Directory
directory "/etc/pki/tls/certs/" do
	recursive true
	mode '0755'
end

directory "/etc/pki/tls/private/" do
	recursive true
	mode '0755'
end

# Add logstash keys
cookbook_file "/etc/pki/tls/certs/logstash-forwarder.crt" do
	source "logstash-forwarder.crt"
	owner "root"
	group "root"
	mode 0644
end
cookbook_file "/etc/pki/tls/private/logstash-forwarder.key" do
	source "logstash-forwarder.key"
	owner "root"
	group "root"
	mode 0644
end

bash "Removing nice cpu" do
	user "root"
	group "root"
	cwd "/tmp"
	code <<-EOH
	sed -i 's/LS_NICE=.*/LS_NICE=0/' /etc/init/logstash.conf
	sed -i "s/LS_CONF_DIR=.*/LS_CONF_DIR=\\/etc\\/logstash\\/conf.d\\/*.conf/" /etc/init/logstash.conf
	sed -i 's/LS_HEAP_SIZE=.*/LS_HEAP_SIZE=\"2048m\"/' /etc/init/logstash.conf
	EOH
   	action :run
end

#Gets config.d from repo.
git "/etc/logstash/conf.d/" do
	repo node[:logstash_scup][:repository]
	user "deployer"
	group "scupadmin"
	revision "master"
	action	:sync
	ssh_wrapper "/usr/local/bin/wrap-ssh4git.sh"
end
