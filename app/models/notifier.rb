class Notifier < ActionMailer::Base
  @@target   = RAILS_ENV == "development" ? "paul.ian.kelly@gmail.com" : "rupertkelly@blueyonder.co.uk"
  @@defaults = {:from         => 'system@money4macs.co.uk',
                :reply_to     => @@target,
                :return_path  => @@target,
                :content_type => "text/html",
                :to           => @@target
  }

  def quote quote
    recipients   [quote.email, @@defaults[:to]]
    #bcc          @@defaults[:to]
    from         @@defaults[:from]
    subject      "New quote"
    reply_to     @@defaults[:return_path]
    content_type @@defaults[:content_type]
    headers      @@defaults[:return_path]
    body         :quote => quote
  end

  def contact body
    recipients   @@defaults[:to]
    from         @@defaults[:from]
    subject      "Contact from mac app"
    content_type @@defaults[:content_type]
    headers      @@defaults[:return_path]
    body         "body" => body
  end

end
