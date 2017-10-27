require 'test_helper'

class TaskmanagerFlowTest < ActionDispatch::IntegrationTest
  def setup
    @task = create(:task)
  end

  test 'can see the welcome page' do
    get '/'
    assert_select 'h1', 'Welcome on my site'
  end

  test 'can create an task' do
    get '/tasks/new'
    assert_response :success

    post '/tasks',
         params: {
           task: {
             title: @task.title
           }
         }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'p', "Title: \n  #{@task.title}"
  end

  test 'can edit an task' do
    get "/tasks/#{@task.id}/edit"
    assert_response :success

    patch "/tasks/#{@task.id}",
          params: {
            task: {
              title: @task.title
            }
          }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'p', "Title: \n  #{@task.title}"
  end

  test 'can delete an task' do
    get "/tasks/#{@task.id}"
    assert_response :success

    assert_difference('Task.count', -1) do
      delete "/tasks/#{@task.id}"
      assert_response :redirect
      follow_redirect!
    end
  end
end
