require "pro1_tester/version"
require 'open3'
require 'rspec'
require 'yaml'


module Pro1Tester
  DIR_BASE = File.expand_path(File.dirname(__FILE__))
  def run
    %x(rspec #{File.join(DIR_BASE, "core.rb")} --color)
  end
end
