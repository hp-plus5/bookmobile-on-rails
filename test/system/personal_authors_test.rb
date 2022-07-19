require "application_system_test_case"

class PersonalAuthorsTest < ApplicationSystemTestCase
  setup do
    @personal_author = personal_authors(:one)
  end

  test "visiting the index" do
    visit personal_authors_url
    assert_selector "h1", text: "Personal authors"
  end

  test "should create personal author" do
    visit personal_authors_url
    click_on "New personal author"

    click_on "Create Personal author"

    assert_text "Personal author was successfully created"
    click_on "Back"
  end

  test "should update Personal author" do
    visit personal_author_url(@personal_author)
    click_on "Edit this personal author", match: :first

    click_on "Update Personal author"

    assert_text "Personal author was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal author" do
    visit personal_author_url(@personal_author)
    click_on "Destroy this personal author", match: :first

    assert_text "Personal author was successfully destroyed"
  end
end
