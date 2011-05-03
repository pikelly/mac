class Notifier < ActionMailer::Base
  @@target   = "rupertkelly@blueyonder.co.uk"
  @@defaults = {:from         => 'system@money4macs.co.uk',
                :reply_to     => @@target,
                :return_path  => {'return-path' => @@target},
                :content_type => "text/html",
                :to           => @@target
  }

  def quote quote
    recipients   @@defaults[:to]
    from         @@defaults[:from]
    subject      "New quote"
    reply_to     @@defaults[:return_path]
    content_type @@defaults[:content_type]
    headers      @@defaults[:return_path]
    body         :quote => quote
  end

end
