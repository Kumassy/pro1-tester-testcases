require 'open3'
require 'rspec'
require 'yaml'


module Pro1Tester
  DIST_DIR = "tmp"
  DIR_BASE = File.expand_path(File.dirname(__FILE__))
  Dir.mkdir DIST_DIR unless Dir.exists? DIST_DIR

  tasks = YAML.load_file(File.join(DIR_BASE,"testcase.yml"))
  tasks.each do |task|
    src_file_identifer = task["target"]
    src_file = Dir.glob(DIR_BASE + "/*").grep(/#{src_file_identifer}.c/).first
    # src_path = File.join(DIR_BASE,src_file)

    # compile
    %x(gcc #{src_file} -o #{File.join(DIST_DIR, src_file_identifer)})


    # parse testcases
    RSpec.describe src_file do
      testcases = task["testcase"]

      testcases.each do |testcase|
        Open3.popen3(File.join(DIR_BASE, DIST_DIR, src_file_identifer)) do |stdin, stdout, stderr, wait_thr|
          if testcase.has_key? "input"
            stdin.write testcase["input"]
            stdin.close
          end

          testcase["result"] = stdout.read
        end

        if testcase.has_key? "input"
          label = testcase.fetch("label",
            "should return \n--------\n#{testcase["expect"]}--------\n when gets \n--------\n#{testcase["input"]}--------")
        else
          label = testcase.fetch("label",
            "should return \n--------\n#{testcase["expect"]}--------")
        end
        it(label) do
          # remove space just in front of LF
          # remove the last LF if exist
          result = testcase["result"]
          result.gsub!(/\s+\n/, "\n")
          result.gsub!(/\n$/, "")

          expectation = testcase["expect"]
          expectation.gsub!(/\s+\n/, "\n")
          expectation.gsub!(/\n$/, "")

          expect(result).to eq expectation
        end
      end
    end
  end
end
