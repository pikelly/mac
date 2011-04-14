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
  def toggle_macbox
    update_page do |page|
      page << 'if (value == 1) {'
      page.show "macboxyes"
      page.hide "macboxno"
      page << '} else {'
      page.hide "macboxyes"
      page.show "macboxno"
      page << '}'
    end
  end
  def terms_and_conditions
    update_page do |page|
      page.alert("The t&c")
    end
  end
end
