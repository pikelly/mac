module HomeHelper
  def shuffle what
    update_page do |page|
      for dom in what[:expand]
        page.visual_effect(:blind_down, dom)
      end
      for dom in what[:contract]
        page.visual_effect(:blind_up, dom)
      end
    end
  end
end
