require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save User without name' do
    user = User.new
    assert_not user.save, 'Name must be filled in'
  end
end

