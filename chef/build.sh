#!/bin/bash -ex

## Install bundler and ruby dependencies
gem install bundler
bundle install

## Generate the directory with all remote and local cookbooks
bundle exec berks update
bundle exec berks vendor vendor-cookbooks/
## Temporary change dir names to tarball use the right tree
mv vendor-cookbooks cookbooks
