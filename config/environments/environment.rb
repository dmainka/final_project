FinalProject::Application.configure do

  config.action_mailer.delivery_method = :smtp | :sendmail | :test

  config.action_mailer.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => "domain.of.sender.net",
    :authentication => "plain",
    :user_name      => "dmainka7",
    :password       => => "dummypwd",
    :enable_starttls_auto => true
  }

end
