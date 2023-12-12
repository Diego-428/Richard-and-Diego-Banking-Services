require "test_helper"

class BankAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_app_index_url
    assert_response :success
  end
end
