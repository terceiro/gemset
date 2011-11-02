require 'test_helper'

class GemsetSetupTest < GemsetTest
  context 'setup' do

    context 'without existing gem directory' do
      setup do
        gemset 'setup'
      end
      should 'create empty  "default" gemset' do
        assert File.directory?(gemset_path('default'))
      end
      should 'symlink gem_home to default gemset' do
        assert_match /@default$/, File.readlink(@gem_home)
      end
      should 'return an ok status' do
        assert_exit_status 0
      end
    end

    context 'with existing gem directory' do
      setup do
        FileUtils.mkdir_p @gem_home
        FileUtils.touch(gemset_path('test'))
        gemset 'setup'
      end
      should 'move the current GEM_HOME to "default" gemset' do
        assert File.exists?(gemset_path('default'))
      end
      should 'return an ok status' do
        assert_exit_status 0
      end
    end

    context 'with existing gem directory and existing "default" gemset' do
      setup do
        FileUtils.mkdir_p @gem_home
        FileUtils.mkdir_p gemset_path('default')
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
        FileUtils.mkdir_p File.dirname(@gem_home)
        File.symlink 'default', @gem_home
        gemset 'setup'
      end
      should 'fail' do
        assert_failure_exit_status
      end
    end


  end

end
