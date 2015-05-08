require 'test_helper'

class SetResultsControllerTest < ActionController::TestCase
  setup do
    @set_result = set_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:set_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create set_result" do
    assert_difference('SetResult.count') do
      post :create, set_result: {  }
    end

    assert_redirected_to set_result_path(assigns(:set_result))
  end

  test "should show set_result" do
    get :show, id: @set_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @set_result
    assert_response :success
  end

  test "should update set_result" do
    patch :update, id: @set_result, set_result: {  }
    assert_redirected_to set_result_path(assigns(:set_result))
  end

  test "should destroy set_result" do
    assert_difference('SetResult.count', -1) do
      delete :destroy, id: @set_result
    end

    assert_redirected_to set_results_path
  end
end
