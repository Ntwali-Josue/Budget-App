require 'test_helper'

class CategoryTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_transaction = category_transactions(:one)
  end

  test 'should get index' do
    get category_transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_transaction_url
    assert_response :success
  end

  test 'should create category_transaction' do
    assert_difference('CategoryTransaction.count') do
      post category_transactions_url, params: { category_transaction: {} }
    end

    assert_redirected_to category_transaction_url(CategoryTransaction.last)
  end

  test 'should show category_transaction' do
    get category_transaction_url(@category_transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_transaction_url(@category_transaction)
    assert_response :success
  end

  test 'should update category_transaction' do
    patch category_transaction_url(@category_transaction), params: { category_transaction: {} }
    assert_redirected_to category_transaction_url(@category_transaction)
  end

  test 'should destroy category_transaction' do
    assert_difference('CategoryTransaction.count', -1) do
      delete category_transaction_url(@category_transaction)
    end

    assert_redirected_to category_transactions_url
  end
end
