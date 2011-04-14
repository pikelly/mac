require 'test_helper'

class PricesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Price.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Price.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Price.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to price_url(assigns(:price))
  end

  def test_edit
    get :edit, :id => Price.first
    assert_template 'edit'
  end

  def test_update_invalid
    Price.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Price.first
    assert_template 'edit'
  end

  def test_update_valid
    Price.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Price.first
    assert_redirected_to price_url(assigns(:price))
  end

  def test_destroy
    price = Price.first
    delete :destroy, :id => price
    assert_redirected_to prices_url
    assert !Price.exists?(price.id)
  end
end
