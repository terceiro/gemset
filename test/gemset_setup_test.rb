require 'test_helper'

class GemsetSetupTest < GemsetTest
  context 'setup' do

    context 'without existing gem directory' do
      setup do
        gemset 'setup'
      end
      should 'create empty  "default" gemset' do
        assert File.directory?(File.join(@tmpdir, 'gems', 'default'))
      end
      should 'symlink default to GEM_HOME' do
        assert_equal 'default', File.readlink(@gem_home)
      end
      should 'return an ok status' do
        assert_exit_status 0
      end
    end

    context 'with existing gem directory' do
      setup do
        FileUtils.mkdir_p @gem_home
        FileUtils.touch(File.join(@gem_home, 'test'))
        gemset 'setup'
      end
      should 'move the current GEM_HOME to "default" gemset' do
        assert File.exists?(File.join(@tmpdir, 'gems', 'default', 'test'))
      end
      should 'return an ok status' do
        assert_exit_status 0
      end
    end

    context 'with existing gem directory and existing "default" gemset' do
      setup do
        FileUtils.mkdir_p @gem_home
        FileUtils.mkdir_p File.join(@tmpdir, 'gems', 'default')
        gemset 'setup'
      end
      should 'complain' do
        assert_output_matches 'Cannot continue'
      end
      should 'return a failure exit code' do
        assert_failure_exit_status
      end
    end


    context 'already set up' do
      setup do
        FileUtils.mkdir_p File.join(@tmpdir, 'gems')
        File.symlink 'default', @gem_home
        gemset 'setup'
      end
      should 'fail' do
        assert_failure_exit_status
      end
    end


  end

end
