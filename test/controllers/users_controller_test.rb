require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
  end

  test 'should get index' do
    get users_path
    assert_response :success

    assert_select 'h1', 'Users'
    assert_equal 'index', @controller.action_name
  end

  test 'should get show User' do
    get user_path @user
    assert_response :success
    assert_equal 'show', @controller.action_name

    assert_select 'h1', 'User'
    assert_select 'p' do |elements|
      elements.each do |element|
        assert_match @user.name, element
      end
    end
    assert_select 'a', 2
  end

  test 'should get new User' do
    get new_user_url
    assert_response :success
    assert_equal 'new', @controller.action_name

    assert_template partial: '_form'
    assert_select 'h1', 'New User'
    assert_select 'form'
  end

  test 'should get edit' do
    get edit_user_path @user
    assert_response :success
    assert_equal 'edit', @controller.action_name

    assert_template partial: '_form'
    assert_select 'h1', 'Edit User'
    assert_select 'form input' do
      assert_select '[value=?]', @user.name
    end
  end

  test 'should create User' do
    assert_difference 'User.count' do
      post users_url(@user),
           params: {
             user: {
               name: @user.name
             }
           }
    end
    assert_equal 'create', @controller.action_name
    assert_redirected_to user_path User.last
    assert_response :redirect
  end

  test 'should not create User' do
    assert_difference 'User.count', 0 do
      post users_url(@user),
           params: {
             user: {
               name: ''
             }
           }
    end
    assert_template :new
  end

  test 'should update User' do
    new_name = 'NewName'
    patch user_url(@user),
          params: {
            user: {
              name: new_name
            }
          }

    assert_redirected_to user_url @user
    @user.reload
    assert_equal new_name, @user.name
  end

  test 'should not update User' do
    patch user_url(@user),
          params: {
            user: {
              name: ''
            }
          }

    assert_template :edit
  end

  test 'should delete User' do
    assert_difference 'User.count', -1 do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
