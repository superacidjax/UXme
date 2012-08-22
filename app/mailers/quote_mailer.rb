class QuoteMailer < ActionMailer::Base
  default from: "do-not-reply@uxme.io"

  def request_quote_email(quote)
    @quote = quote
    mail(:to => "superacidjax@me.com", :subject => "Requesting a Quote")
  end

end