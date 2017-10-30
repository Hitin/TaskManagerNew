require 'application_system_test_case'

class TasksTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit tasks_url
    assert_selector 'h1', text: 'All tasks'
  end

  test 'creating an task' do
    visit tasks_path

    click_on 'New Task'
    fill_in 'task[title]', with: 'Creating an Task'

    click_on 'Create Task'

    assert_text 'Creating an Task'
  end
end
