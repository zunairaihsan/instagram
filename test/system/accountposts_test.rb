require "application_system_test_case"

class AccountpostsTest < ApplicationSystemTestCase
  setup do
    @accountpost = accountposts(:one)
  end

  test "visiting the index" do
    visit accountposts_url
    assert_selector "h1", text: "Accountposts"
  end

  test "creating a Accountpost" do
    visit accountposts_url
    click_on "New Accountpost"

    click_on "Create Accountpost"

    assert_text "Accountpost was successfully created"
    click_on "Back"
  end

  test "updating a Accountpost" do
    visit accountposts_url
    click_on "Edit", match: :first

    click_on "Update Accountpost"

    assert_text "Accountpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Accountpost" do
    visit accountposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accountpost was successfully destroyed"
  end
end
