require "test_helper"

class PersonalAuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_author = personal_authors(:one)
  end

  test "should get index" do
    get personal_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_author_url
    assert_response :success
  end

  test "should create personal_author" do
    assert_difference("PersonalAuthor.count") do
      post personal_authors_url, params: { personal_author: {  } }
    end

    assert_redirected_to personal_author_url(PersonalAuthor.last)
  end

  test "should show personal_author" do
    get personal_author_url(@personal_author)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_author_url(@personal_author)
    assert_response :success
  end

  test "should update personal_author" do
    patch personal_author_url(@personal_author), params: { personal_author: {  } }
    assert_redirected_to personal_author_url(@personal_author)
  end

  test "should destroy personal_author" do
    assert_difference("PersonalAuthor.count", -1) do
      delete personal_author_url(@personal_author)
    end

    assert_redirected_to personal_authors_url
  end
end
