# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_habtm associations
    render :partial => 'common/show_habtm', :collection => associations, :as => :association
  end

  def edit_habtm klass, association
    render :partial => 'common/edit_habtm', :locals =>{ :klass => klass, :associations => association.all.sort.delete_if{|e| e == klass}}
  end

  def contract name
    name.to_s
  end

end
