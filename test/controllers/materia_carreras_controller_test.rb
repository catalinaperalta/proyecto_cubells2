require 'test_helper'

class MateriaCarrerasControllerTest < ActionController::TestCase
  setup do
    @materia_carrera = materia_carreras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materia_carreras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materia_carrera" do
    assert_difference('MateriaCarrera.count') do
      post :create, materia_carrera: { carrera_id: @materia_carrera.carrera_id, materia_id: @materia_carrera.materia_id, semestre: @materia_carrera.semestre }
    end

    assert_redirected_to materia_carrera_path(assigns(:materia_carrera))
  end

  test "should show materia_carrera" do
    get :show, id: @materia_carrera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materia_carrera
    assert_response :success
  end

  test "should update materia_carrera" do
    patch :update, id: @materia_carrera, materia_carrera: { carrera_id: @materia_carrera.carrera_id, materia_id: @materia_carrera.materia_id, semestre: @materia_carrera.semestre }
    assert_redirected_to materia_carrera_path(assigns(:materia_carrera))
  end

  test "should destroy materia_carrera" do
    assert_difference('MateriaCarrera.count', -1) do
      delete :destroy, id: @materia_carrera
    end

    assert_redirected_to materia_carreras_path
  end
end
