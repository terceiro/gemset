require 'test_helper'

class GemsetListTest < GemsetTest

  context 'a clean gemset setup' do
    setup do
      gemset 'setup'
    end
    should 'list only the default gemset' do
      gemset 'list'
      assert_output_matches /default/
      assert_stderr_matches /^$/
    end
  end

  context 'with gemsets gs1 and gs2' do

    setup do
      gemset 'setup'
      gemset 'create gs1'
      gemset 'create gs2'
    end

    should 'list gs1 and gs2' do
      gemset 'list'
      assert_output_matches /gs1/
      assert_output_matches /gs2/
    end

  end
end
