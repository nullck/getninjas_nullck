#
# Cookbook Name:: logstash-scup
# Recipe:: default
#
# Copyright 2015, Scup/Vizir
#
# All rights reserved - Do Not Redistribute
#

include_recipe "logstash-scup::install"
include_recipe "logstash-scup::config-d"
include_recipe "logstash-scup::restart"
include_recipe "logstash-scup::curator"
