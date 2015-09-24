require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "project relationship" do
    assert_respond_to(Task.new, :project)
  end
  
end
