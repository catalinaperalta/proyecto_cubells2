require 'test_helper'

class ParcialsControllerTest < ActionController::TestCase
  setup do
    @parcial = parcials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parcials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parcial" do
    assert_difference('Parcial.count') do
      post :create, parcial: { calificacion: @parcial.calificacion, id_materia_alumno: @parcial.id_materia_alumno, numero: @parcial.numero }
    end

    assert_redirected_to parcial_path(assigns(:parcial))
  end

  test "should show parcial" do
    get :show, id: @parcial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parcial
    assert_response :success
  end

  test "should update parcial" do
    patch :update, id: @parcial, parcial: { calificacion: @parcial.calificacion, id_materia_alumno: @parcial.id_materia_alumno, numero: @parcial.numero }
    assert_redirected_to parcial_path(assigns(:parcial))
  end

  test "should destroy parcial" do
    assert_difference('Parcial.count', -1) do
      delete :destroy, id: @parcial
    end

    assert_redirected_to parcials_path
  end
end
