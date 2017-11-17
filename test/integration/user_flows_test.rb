require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
  end

  test 'can see link on create new user' do
    get '/'
    assert_select 'a', 'Users'
  end

  test 'can show user' do
    get "/users/#{@user.id}"

    assert_generates "/users/#{@user.id}", controller: 'users', action: 'show', id: @user.id.to_s
    assert_recognizes({ controller: 'users', action: 'show', id: @user.id.to_s  }, path: "users/#{@user.id}", method: 'get')
    assert_routing({ path: "users/#{@user.id}", method: :get }, controller: 'users', action: 'show', id: @user.id.to_s)
  end
end
