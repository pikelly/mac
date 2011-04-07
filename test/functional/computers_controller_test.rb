require 'test_helper'

class ComputersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Computer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Computer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Computer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to computer_url(assigns(:computer))
  end

  def test_edit
    get :edit, :id => Computer.first
    assert_template 'edit'
  end

  def test_update_invalid
    Computer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Computer.first
    assert_template 'edit'
  end

  def test_update_valid
    Computer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Computer.first
    assert_redirected_to computer_url(assigns(:computer))
  end

  def test_destroy
    computer = Computer.first
    delete :destroy, :id => computer
    assert_redirected_to computers_url
    assert !Computer.exists?(computer.id)
  end
end
