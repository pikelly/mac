require 'test_helper'

class RamsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Ram.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Ram.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ram.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ram_url(assigns(:ram))
  end

  def test_edit
    get :edit, :id => Ram.first
    assert_template 'edit'
  end

  def test_update_invalid
    Ram.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ram.first
    assert_template 'edit'
  end

  def test_update_valid
    Ram.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ram.first
    assert_redirected_to ram_url(assigns(:ram))
  end

  def test_destroy
    ram = Ram.first
    delete :destroy, :id => ram
    assert_redirected_to rams_url
    assert !Ram.exists?(ram.id)
  end
end
