require 'test_helper'

class NotesErbControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notes_erb_index_url
    assert_response :success
  end

end
