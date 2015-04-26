require 'test_helper'

class MateriaProfesorsControllerTest < ActionController::TestCase
  setup do
    @materia_profesor = materia_profesors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materia_profesors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materia_profesor" do
    assert_difference('MateriaProfesor.count') do
      post :create, materia_profesor: { materia_id: @materia_profesor.materia_id, profesor_id: @materia_profesor.profesor_id }
    end

    assert_redirected_to materia_profesor_path(assigns(:materia_profesor))
  end

  test "should show materia_profesor" do
    get :show, id: @materia_profesor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materia_profesor
    assert_response :success
  end

  test "should update materia_profesor" do
    patch :update, id: @materia_profesor, materia_profesor: { materia_id: @materia_profesor.materia_id, profesor_id: @materia_profesor.profesor_id }
    assert_redirected_to materia_profesor_path(assigns(:materia_profesor))
  end

  test "should destroy materia_profesor" do
    assert_difference('MateriaProfesor.count', -1) do
      delete :destroy, id: @materia_profesor
    end

    assert_redirected_to materia_profesors_path
  end
end
