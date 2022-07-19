require "application_system_test_case"

class PersonalBooksTest < ApplicationSystemTestCase
  setup do
    @personal_book = personal_books(:one)
  end

  test "visiting the index" do
    visit personal_books_url
    assert_selector "h1", text: "Personal books"
  end

  test "should create personal book" do
    visit personal_books_url
    click_on "New personal book"

    click_on "Create Personal book"

    assert_text "Personal book was successfully created"
    click_on "Back"
  end

  test "should update Personal book" do
    visit personal_book_url(@personal_book)
    click_on "Edit this personal book", match: :first

    click_on "Update Personal book"

    assert_text "Personal book was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal book" do
    visit personal_book_url(@personal_book)
    click_on "Destroy this personal book", match: :first

    assert_text "Personal book was successfully destroyed"
  end
end
