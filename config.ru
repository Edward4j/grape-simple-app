#!/usr/bin/env rackup

require './config/boot'
require './config/environment'
require './config/application'

run Application::app
