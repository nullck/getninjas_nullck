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
```


##Endpoints:##

```
Kibana: search-getninjas-r74hrslc4sj6d35ksw76npl3iu.us-west-2.es.amazonaws.com/_plugin/kibana/

Repositories:
app sample: git@bitbucket.org:nullck/getninjas_app_sample.git
main repository: git@bitbucket.org:nullck/getninjas_nullck.git
chef cookbook: git@bitbucket.org:nullck/getninjas_logstash.git
```

##Instructions##



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
$vagrant provision
```

- Done !!! Please see if your new logs is displayed in our Kibana, log viewer:

```
http://search-getninjas-r74hrslc4sj6d35ksw76npl3iu.us-west-2.es.amazonaws.com/_plugin/kibana/
```


## AWS Topology

![getninjas_test](https://bitbucket.org/repo/zkzgRo/images/3618082859-getninjas_test%20(2).png)