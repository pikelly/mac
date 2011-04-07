module HomeHelper
  def expand what
    update_page do |page|
      page.visual_effect(:toggle_blind, what)
    end
  end
end
