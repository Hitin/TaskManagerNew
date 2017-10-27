require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @task = create(:task)
  end

  test 'should get index' do
    get tasks_url
    assert_response :success

    assert_equal "index", @controller.action_name
    #assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Taskmanager", @response.body
  end

  test 'should create Task' do
    assert_difference('Task.count') do
      post tasks_url(@task.id),
           params: {
             task: {
               title: @task.title
             }
           }
    end
    assert_redirected_to task_path Task.last
    assert_equal 'Task was successfully created.', flash[:notice]
  end

  test 'should get show' do
    get task_url @task
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url @task
    assert_response :success
  end

  test 'should get update' do
    patch task_url @task,
                   params: {
                     task: {
                       title: 'New text'
                     }
                   }
    assert_redirected_to task_url @task
    @task.reload
    assert_equal "New text", @task.title
    assert_equal 'Task was successfully edited.', flash[:notice]
  end

  test 'should get destroy' do
    assert_difference('Task.count', -1) do
      delete task_url @task,
                      params: {
                        task: {
                          title: @task.title
                        }
                      }
    end
    assert_redirected_to tasks_url
  end
end
