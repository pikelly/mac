require 'test_helper'

class ProcessorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Processor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Processor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Processor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to processor_url(assigns(:processor))
  end

  def test_edit
    get :edit, :id => Processor.first
    assert_template 'edit'
  end

  def test_update_invalid
    Processor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Processor.first
    assert_template 'edit'
  end

  def test_update_valid
    Processor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Processor.first
    assert_redirected_to processor_url(assigns(:processor))
  end

  def test_destroy
    processor = Processor.first
    delete :destroy, :id => processor
    assert_redirected_to processors_url
    assert !Processor.exists?(processor.id)
  end
end
