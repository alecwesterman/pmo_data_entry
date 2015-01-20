require 'test_helper'

class TqaAspectsControllerTest < ActionController::TestCase
  setup do
    @tqa_aspect = tqa_aspects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqa_aspects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqa_aspect" do
    assert_difference('TqaAspect.count') do
      post :create, tqa_aspect: { name: @tqa_aspect.name, percent_pass: @tqa_aspect.percent_pass, percent_run: @tqa_aspect.percent_run }
    end

    assert_redirected_to tqa_aspect_path(assigns(:tqa_aspect))
  end

  test "should show tqa_aspect" do
    get :show, id: @tqa_aspect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqa_aspect
    assert_response :success
  end

  test "should update tqa_aspect" do
    patch :update, id: @tqa_aspect, tqa_aspect: { name: @tqa_aspect.name, percent_pass: @tqa_aspect.percent_pass, percent_run: @tqa_aspect.percent_run }
    assert_redirected_to tqa_aspect_path(assigns(:tqa_aspect))
  end

  test "should destroy tqa_aspect" do
    assert_difference('TqaAspect.count', -1) do
      delete :destroy, id: @tqa_aspect
    end

    assert_redirected_to tqa_aspects_path
  end
end
