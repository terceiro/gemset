require 'test_helper'

class GemsetCommandsTest < GemsetTest
  should 'list commands' do
    gemset 'commands'
    assert_output_matches /^create$/
    assert_output_matches /^list$/
    assert_output_matches /^use$/
    assert_output_matches /^show$/
  end
end
