require 'test_helper'

class GemsetCurrentTest < GemsetTest

  should 'require setup first' do
    gemset 'current'
    assert_failure_exit_status
  end

  should 'list the default gemset' do
    gemset 'setup'
    gemset 'current'
    assert_output_matches /^default$/
  end

  should 'corretly list the new gemset' do
    gemset 'setup'
    gemset 'create tmp'
    gemset 'use tmp'
    gemset 'current'
    assert_output_matches /^tmp$/
  end

end
