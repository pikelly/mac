require 'test_helper'

class PotsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Pot.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Pot.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Pot.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pot_url(assigns(:pot))
  end
  
  def test_edit
    get :edit, :id => Pot.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Pot.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pot.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Pot.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pot.first
    assert_redirected_to pot_url(assigns(:pot))
  end
  
  def test_destroy
    pot = Pot.first
    delete :destroy, :id => pot
    assert_redirected_to pots_url
    assert !Pot.exists?(pot.id)
  end
end
