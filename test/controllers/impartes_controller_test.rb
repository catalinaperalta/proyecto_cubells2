require 'test_helper'

class ImpartesControllerTest < ActionController::TestCase
  setup do
    @imparte = impartes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impartes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imparte" do
    assert_difference('Imparte.count') do
      post :create, imparte: { codma: @imparte.codma, nomina: @imparte.nomina }
    end

    assert_redirected_to imparte_path(assigns(:imparte))
  end

  test "should show imparte" do
    get :show, id: @imparte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imparte
    assert_response :success
  end

  test "should update imparte" do
    patch :update, id: @imparte, imparte: { codma: @imparte.codma, nomina: @imparte.nomina }
    assert_redirected_to imparte_path(assigns(:imparte))
  end

  test "should destroy imparte" do
    assert_difference('Imparte.count', -1) do
      delete :destroy, id: @imparte
    end

    assert_redirected_to impartes_path
  end
end
