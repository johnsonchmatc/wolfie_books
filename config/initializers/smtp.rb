ActionMailer::Base.smtp_settings = {
      :address              => ENV['smtp_server'],
      :port                 => 587,
      :user_name            => ENV['smtp_user'],
      :password             => ENV['smtp_password'],
      :authentication       => 'login',
      :enable_starttls_auto => true,
      :openssl_verify_mode => 'none'
}
