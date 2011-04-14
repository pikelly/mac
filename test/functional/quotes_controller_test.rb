require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Quote.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Quote.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Quote.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to quote_url(assigns(:quote))
  end

  def test_edit
    get :edit, :id => Quote.first
    assert_template 'edit'
  end

  def test_update_invalid
    Quote.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Quote.first
    assert_template 'edit'
  end

  def test_update_valid
    Quote.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Quote.first
    assert_redirected_to quote_url(assigns(:quote))
  end

  def test_destroy
    quote = Quote.first
    delete :destroy, :id => quote
    assert_redirected_to quotes_url
    assert !Quote.exists?(quote.id)
  end
end
