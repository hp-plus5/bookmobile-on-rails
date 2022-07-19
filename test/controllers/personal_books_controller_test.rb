require "test_helper"

class PersonalBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_book = personal_books(:one)
  end

  test "should get index" do
    get personal_books_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_book_url
    assert_response :success
  end

  test "should create personal_book" do
    assert_difference("PersonalBook.count") do
      post personal_books_url, params: { personal_book: {  } }
    end

    assert_redirected_to personal_book_url(PersonalBook.last)
  end

  test "should show personal_book" do
    get personal_book_url(@personal_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_book_url(@personal_book)
    assert_response :success
  end

  test "should update personal_book" do
    patch personal_book_url(@personal_book), params: { personal_book: {  } }
    assert_redirected_to personal_book_url(@personal_book)
  end

  test "should destroy personal_book" do
    assert_difference("PersonalBook.count", -1) do
      delete personal_book_url(@personal_book)
    end

    assert_redirected_to personal_books_url
  end
end
