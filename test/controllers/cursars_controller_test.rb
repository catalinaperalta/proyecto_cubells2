require 'test_helper'

class CursarsControllerTest < ActionController::TestCase
  setup do
    @cursar = cursars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursar" do
    assert_difference('Cursar.count') do
      post :create, cursar: { codma: @cursar.codma, fecha: @cursar.fecha, matricula: @cursar.matricula }
    end

    assert_redirected_to cursar_path(assigns(:cursar))
  end

  test "should show cursar" do
    get :show, id: @cursar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cursar
    assert_response :success
  end

  test "should update cursar" do
    patch :update, id: @cursar, cursar: { codma: @cursar.codma, fecha: @cursar.fecha, matricula: @cursar.matricula }
    assert_redirected_to cursar_path(assigns(:cursar))
  end

  test "should destroy cursar" do
    assert_difference('Cursar.count', -1) do
      delete :destroy, id: @cursar
    end

    assert_redirected_to cursars_path
  end
end
