require "application_system_test_case"

class ConstructionExpensesTest < ApplicationSystemTestCase
  setup do
    @construction_expense = construction_expenses(:one)
  end

  test "visiting the index" do
    visit construction_expenses_url
    assert_selector "h1", text: "Construction Expenses"
  end

  test "creating a Construction expense" do
    visit construction_expenses_url
    click_on "New Construction Expense"

    fill_in "Amount", with: @construction_expense.amount
    fill_in "Material description", with: @construction_expense.material_description
    fill_in "Owner", with: @construction_expense.owner
    click_on "Create Construction expense"

    assert_text "Construction expense was successfully created"
    click_on "Back"
  end

  test "updating a Construction expense" do
    visit construction_expenses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @construction_expense.amount
    fill_in "Material description", with: @construction_expense.material_description
    fill_in "Owner", with: @construction_expense.owner
    click_on "Update Construction expense"

    assert_text "Construction expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Construction expense" do
    visit construction_expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Construction expense was successfully destroyed"
  end
end
