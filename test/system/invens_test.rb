require "application_system_test_case"

class InvensTest < ApplicationSystemTestCase
  setup do
    @inven = invens(:one)
  end

  test "visiting the index" do
    visit invens_url
    assert_selector "h1", text: "Invens"
  end

  test "creating a Inven" do
    visit invens_url
    click_on "New Inven"

    fill_in "Location", with: @inven.location
    fill_in "Name", with: @inven.name
    click_on "Create Inven"

    assert_text "Inven was successfully created"
    click_on "Back"
  end

  test "updating a Inven" do
    visit invens_url
    click_on "Edit", match: :first

    fill_in "Location", with: @inven.location
    fill_in "Name", with: @inven.name
    click_on "Update Inven"

    assert_text "Inven was successfully updated"
    click_on "Back"
  end

  test "destroying a Inven" do
    visit invens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inven was successfully destroyed"
  end
end
