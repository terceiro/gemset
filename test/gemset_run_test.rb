require 'test_helper'

class GemsetRunTest < GemsetTest

  context 'running a command' do
    setup do
      File.open('myprogram.rb', 'w') do |f|
        f.puts('puts ENV["GEM_HOME"]')
      end
      gemset 'setup'
    end
    teardown do
      FileUtils.rm_f('myprogram.rb')
    end

    should 'set GEM_HOME when running commands' do
      assert_equal @gem_home, `gemset run ruby myprogram.rb`.strip
    end

  end

end
