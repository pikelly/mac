module QuotesHelper
  def shuffle what
    update_page do |page|
      for dom in what[:expand]
        page.visual_effect(:blind_down, dom)
      end if what[:expand]
      for dom in what[:contract]
        page.visual_effect(:blind_up, dom)
      end if what[:contract]
    end
  end
end
