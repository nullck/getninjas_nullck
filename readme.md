##Requirements##

- Vagrant

```
download and installation:
https://www.vagrantup.com/downloads.html
```

- Ruby stable version and rvm

```
$gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$curl -sSL https://get.rvm.io | bash -s stable
$source ~/.profile
$rvm install ruby
```


##Endpoints:##

```
Kibana: search-getninjas-r74hrslc4sj6d35ksw76npl3iu.us-west-2.es.amazonaws.com/_plugin/kibana/

Repositories:
app sample: git@github.com:nullck/getninjas_app_sample.git
main repository: git@github.com:nullck/getninjas_nullck.git
chef cookbook: git@github.com:nullck/getninjas_logstash.git
docker app sample image: https://hub.docker.com/r/nullck/getninjas_app_sample
```

##Instructions##

- Verify if you have all of requirements described at requirements session.

- Clone the repository git@bitbucket.org:nullck/getninjas_nullck.git

```
$git clone git@bitbucket.org:nullck/getninjas_nullck.git
```

- Enter the dir getninjas_nullck/chef and execute the bash script called build.sh

```
$cd getninjas_nullck/chef
$bash build.sh
```

- Back to project root dir and start the vagrant (this command can take a long time to be succeded, then take a coffe and listen a good music) 

```
$cd ../
$vagrant up
```
Maybe could be necessary to run other command to force provision

```
$vagrant provision
```

If you see this message in the console output:

```
==> default: Running provisioner: shell...
    default: Running: inline script
==> default: Cloning into 'getninjas_app_sample'...
==> default: Running provisioner: docker...
    default: Installing Docker onto machine...
==> default: Starting Docker containers...
==> default: -- Container: nullck/getninjas_app_sample
```

- Well Done !!! Our vagrant test box is already !! Please see if your new logs is displayed in our Kibana, log viewer:

```
http://search-getninjas-r74hrslc4sj6d35ksw76npl3iu.us-west-2.es.amazonaws.com/_plugin/kibana/
```

## AWS Topology

![getninjas_test.png](https://bitbucket.org/repo/zkzgRo/images/1324605746-getninjas_test.png)