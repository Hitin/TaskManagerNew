require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
  end
  test 'can see link on create new user' do
    get '/'
    assert_select 'a', 'Users'
  end

 
end
