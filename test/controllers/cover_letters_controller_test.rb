require "test_helper"

class CoverLettersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cover_letters_show_url
    assert_response :success
  end

  test "should get create" do
    get cover_letters_create_url
    assert_response :success
  end
end
