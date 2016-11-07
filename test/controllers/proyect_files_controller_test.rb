require 'test_helper'

class ProyectFilesControllerTest < ActionController::TestCase
  setup do
    @proyect_file = proyect_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyect_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyect_file" do
    assert_difference('ProyectFile.count') do
      post :create, proyect_file: { format_img: @proyect_file.format_img, name: @proyect_file.name, proyect_id: @proyect_file.proyect_id, url_img: @proyect_file.url_img }
    end

    assert_redirected_to proyect_file_path(assigns(:proyect_file))
  end

  test "should show proyect_file" do
    get :show, id: @proyect_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyect_file
    assert_response :success
  end

  test "should update proyect_file" do
    patch :update, id: @proyect_file, proyect_file: { format_img: @proyect_file.format_img, name: @proyect_file.name, proyect_id: @proyect_file.proyect_id, url_img: @proyect_file.url_img }
    assert_redirected_to proyect_file_path(assigns(:proyect_file))
  end

  test "should destroy proyect_file" do
    assert_difference('ProyectFile.count', -1) do
      delete :destroy, id: @proyect_file
    end

    assert_redirected_to proyect_files_path
  end
end
