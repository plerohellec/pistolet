#!/bin/bash

nohup rvmsudo bundle exec ruby pistolet.rb >> log/pistolet.log 2>&1 &
