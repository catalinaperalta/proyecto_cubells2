require 'test_helper'

class MateriaAlumnosControllerTest < ActionController::TestCase
  setup do
    @materia_alumno = materia_alumnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materia_alumnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materia_alumno" do
    assert_difference('MateriaAlumno.count') do
      post :create, materia_alumno: { alumno_id: @materia_alumno.alumno_id, fecha: @materia_alumno.fecha, materia_id: @materia_alumno.materia_id }
    end

    assert_redirected_to materia_alumno_path(assigns(:materia_alumno))
  end

  test "should show materia_alumno" do
    get :show, id: @materia_alumno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materia_alumno
    assert_response :success
  end

  test "should update materia_alumno" do
    patch :update, id: @materia_alumno, materia_alumno: { alumno_id: @materia_alumno.alumno_id, fecha: @materia_alumno.fecha, materia_id: @materia_alumno.materia_id }
    assert_redirected_to materia_alumno_path(assigns(:materia_alumno))
  end

  test "should destroy materia_alumno" do
    assert_difference('MateriaAlumno.count', -1) do
      delete :destroy, id: @materia_alumno
    end

    assert_redirected_to materia_alumnos_path
  end
end
