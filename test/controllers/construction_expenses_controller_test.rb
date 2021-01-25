require 'test_helper'

class ConstructionExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_expense = construction_expenses(:one)
  end

  test "should get index" do
    get construction_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_expense_url
    assert_response :success
  end

  test "should create construction_expense" do
    assert_difference('ConstructionExpense.count') do
      post construction_expenses_url, params: { construction_expense: { amount: @construction_expense.amount, material_description: @construction_expense.material_description, owner: @construction_expense.owner } }
    end

    assert_redirected_to construction_expense_url(ConstructionExpense.last)
  end

  test "should show construction_expense" do
    get construction_expense_url(@construction_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_expense_url(@construction_expense)
    assert_response :success
  end

  test "should update construction_expense" do
    patch construction_expense_url(@construction_expense), params: { construction_expense: { amount: @construction_expense.amount, material_description: @construction_expense.material_description, owner: @construction_expense.owner } }
    assert_redirected_to construction_expense_url(@construction_expense)
  end

  test "should destroy construction_expense" do
    assert_difference('ConstructionExpense.count', -1) do
      delete construction_expense_url(@construction_expense)
    end

    assert_redirected_to construction_expenses_url
  end
end
