require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "client relationship" do
    assert_respond_to( Project.new, :client)
  end
  
  test "can have many tasks" do
    project = Project.create(title: 'Website')
    task1 = Task.create(description: 'awesome task', project_id: project.id)
    task2 = Task.create(description: 'awesome other task', project_id: project.id)
    
    assert true, project.tasks.include?(task1)
    assert true, project.tasks.include?(task2)
    assert_equal project.tasks.size, 2
  end
end
