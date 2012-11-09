require 'simplecov'
require 'json'
SimpleCov.start  do
  add_filter "/test/"
end

require 'bundler'
require 'minitest/autorun'
require File.expand_path(__FILE__)
