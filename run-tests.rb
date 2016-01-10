require_relative 'bootstrap'
require 'test/unit'

Dir["tests/**/*.rb"].each{|s| load s }