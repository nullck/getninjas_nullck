#!/bin/bash
cd /vagrant;
if [ -d "getninjas_app_sample" ]; then
	rm -rf getninjas_app_sample
	git clone https://github.com/nullck/getninjas_app_sample.git 
else
	git clone https://github.com/nullck/getninjas_app_sample.git
fi
