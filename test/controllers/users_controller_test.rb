require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)  
  end

  test 'should get index' do    
    get users_path
    assert_response :success

    assert_select 'h1', 'Users'
    assert_equal 'index' , @controller.action_name
  end

  test 'should get show User' do    
    get user_path @user
    assert_response :success
    assert_equal 'show' , @controller.action_name

    assert_select 'h1', 'User'
    assert_select 'p' do |elements|
      elements.each do |element|
        assert_match "#{@user.name}", element
      end
    end
  end

  test 'should get new User' do    
    get new_user_url 
    assert_response :success
    assert_equal 'new' , @controller.action_name

    assert_template :partial => '_form'

    assert_select 'h1', 'New User'
  end

  test 'should get edit' do    
    get edit_user_path @user
    assert_response :success
    assert_equal 'edit' , @controller.action_name

    assert_select 'h1', 'Edit User'
    #assert_select 'label', 'Name'
    #assert_select 'p' do |elements|
    #  elements.each do |element|
    #    assert_select 'label', 'Name'
    #  end
    #end
  end

  test 'should get create User' do    
    assert_difference 'User.count' do
      post users_url(@user), 
           params: {
             user: {
              name: @user.name
             }
           }
    end
    assert_redirected_to user_path User.last
    assert_response :redirect

  end
end
