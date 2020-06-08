require 'test_helper'

class NotesSlimControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notes_slim_index_url
    assert_response :success
  end

end
