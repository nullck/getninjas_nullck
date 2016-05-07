#!/bin/bash
cd /vagrant;
if [ -d "getninjas_app_sample" ]; then
	rm -rf getninjas_app_sample
	git clone https://nullck@bitbucket.org/nullck/getninjas_app_sample.git
else
	git clone https://nullck@bitbucket.org/nullck/getninjas_app_sample.git
fi
