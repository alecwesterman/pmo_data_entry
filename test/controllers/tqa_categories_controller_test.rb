require 'test_helper'

class TqaCategoriesControllerTest < ActionController::TestCase
  setup do
    @tqa_category = tqa_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqa_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqa_category" do
    assert_difference('TqaCategory.count') do
      post :create, tqa_category: { name: @tqa_category.name }
    end

    assert_redirected_to tqa_category_path(assigns(:tqa_category))
  end

  test "should show tqa_category" do
    get :show, id: @tqa_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqa_category
    assert_response :success
  end

  test "should update tqa_category" do
    patch :update, id: @tqa_category, tqa_category: { name: @tqa_category.name }
    assert_redirected_to tqa_category_path(assigns(:tqa_category))
  end

  test "should destroy tqa_category" do
    assert_difference('TqaCategory.count', -1) do
      delete :destroy, id: @tqa_category
    end

    assert_redirected_to tqa_categories_path
  end
end
