require 'application_system_test_case'

class CategoryTransactionsTest < ApplicationSystemTestCase
  setup do
    @category_transaction = category_transactions(:one)
  end

  test 'visiting the index' do
    visit category_transactions_url
    assert_selector 'h1', text: 'Category transactions'
  end

  test 'should create category transaction' do
    visit category_transactions_url
    click_on 'New category transaction'

    click_on 'Create Category transaction'

    assert_text 'Category transaction was successfully created'
    click_on 'Back'
  end

  test 'should update Category transaction' do
    visit category_transaction_url(@category_transaction)
    click_on 'Edit this category transaction', match: :first

    click_on 'Update Category transaction'

    assert_text 'Category transaction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Category transaction' do
    visit category_transaction_url(@category_transaction)
    click_on 'Destroy this category transaction', match: :first

    assert_text 'Category transaction was successfully destroyed'
  end
end
