require 'test_helper'

class GemsetCreateTest < GemsetTest
  context 'create' do
    setup do
      gemset 'create test'
    end

    should 'first creating' do
      assert_directory_exists GEM_HOME_PARENT + '/test'
    end

    should 'return an ok status' do
      assert_exit_status 0
    end

    context 'trying to create with the name of an existing gemset' do
      setup do
        gemset 'create test'
      end
      should 'return an error when creating an already existing gemset' do
        assert_exit_status 2
      end
      should 'warn the user' do
        assert_output_matches /There is already/
      end
    end

  end
end
