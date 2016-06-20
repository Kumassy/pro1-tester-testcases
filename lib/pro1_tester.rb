require "pro1_tester/version"
require 'open3'
require 'rspec'
require 'yaml'


module Pro1Tester
  DIST_DIR = "tmp"
  DIR_BASE = File.expand_path(File.dirname(__FILE__))
  # DIR_BASE = File.expand_path(File.dirname(__FILE__))
  DIR_PWD = Dir.pwd
  ENV_KEY = "PRO1_TESTER_TESTCASE"

  Dir.mkdir DIST_DIR unless Dir.exists? DIST_DIR

  class << self
    def run
      # puts %x(rspec #{File.join(DIR_BASE, "core.rb")} --color)
      Open3.pipeline("rspec #{File.join(DIR_BASE, "core.rb")} --color")
    end
  end
end
