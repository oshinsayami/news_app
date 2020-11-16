require 'bundler'
Bundler.require 
require 'dotenv/load'

require 'pry'
require 'httparty'
require 'json'

require_relative "./lib/api"
require_relative "./lib/cli"
require_relative "./lib/article"