require "pro1_tester/version"
require 'open3'
require 'rspec'
require 'yaml'


module Pro1Tester
  def run
    %x(rspec core.rb --color)
  end
end
