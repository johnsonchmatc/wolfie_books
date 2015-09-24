require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "project relationship" do
    assert_respond_to( Client.new, :projects)
  end
  
  test "client can access project name" do
    client = Client.create(name: 'Awesome Co.')
    project = Project.create(title: 'Web Site',
                          client_id: client.id) 
    assert_equal client.projects.first, project
  end
end
