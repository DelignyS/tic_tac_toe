$:.unshift File.expand_path("./../lib", __FILE__)
require 'hub'
require 'pry'

Hub.new.entry
binding.pry