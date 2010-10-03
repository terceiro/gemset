require 'test_helper'

class GemsetListTest < GemsetTest

  context 'without no gemsets' do
    should 'list no gemsets' do
      gemset 'list'
      assert_output_matches /^$/
    end
  end

  context 'with gemsets gs1 and gs2' do

    setup do
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
