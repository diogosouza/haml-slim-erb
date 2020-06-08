require 'test_helper'

class NotesHamlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notes_haml_index_url
    assert_response :success
  end

end
