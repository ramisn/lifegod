require "application_system_test_case"

class TestpagesTest < ApplicationSystemTestCase
  setup do
    @testpage = testpages(:one)
  end

  test "visiting the index" do
    visit testpages_url
    assert_selector "h1", text: "Testpages"
  end

  test "creating a Testpage" do
    visit testpages_url
    click_on "New Testpage"

    fill_in "Name", with: @testpage.name
    fill_in "Place", with: @testpage.place
    click_on "Create Testpage"

    assert_text "Testpage was successfully created"
    click_on "Back"
  end

  test "updating a Testpage" do
    visit testpages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @testpage.name
    fill_in "Place", with: @testpage.place
    click_on "Update Testpage"

    assert_text "Testpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Testpage" do
    visit testpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testpage was successfully destroyed"
  end
end
