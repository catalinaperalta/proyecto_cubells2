require 'test_helper'

class ActividadsControllerTest < ActionController::TestCase
  setup do
    @actividad = actividads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actividad" do
    assert_difference('Actividad.count') do
      post :create, actividad: { calificacion: @actividad.calificacion, descripcion: @actividad.descripcion, id_parcial: @actividad.id_parcial, nombre: @actividad.nombre, ponderacion: @actividad.ponderacion }
    end

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should show actividad" do
    get :show, id: @actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actividad
    assert_response :success
  end

  test "should update actividad" do
    patch :update, id: @actividad, actividad: { calificacion: @actividad.calificacion, descripcion: @actividad.descripcion, id_parcial: @actividad.id_parcial, nombre: @actividad.nombre, ponderacion: @actividad.ponderacion }
    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should destroy actividad" do
    assert_difference('Actividad.count', -1) do
      delete :destroy, id: @actividad
    end

    assert_redirected_to actividads_path
  end
end
