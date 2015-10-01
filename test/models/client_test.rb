require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "project relationship" do
    assert_respond_to( Client.new, :projects)
  end
end
