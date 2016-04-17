# setup action_mailer production heroku with sendgrid
# https://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku/
# https://www.google.com/settings/u/0/security/lesssecureapps

Rails.application.configure do

	# change mail delivery to either :smtp, :sendmail, :file, :test
	config.action_mailer.delivery_method = :smtp	
	
	if Rails.env.development?
		config.action_mailer.raise_delivery_errors = true
		config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
	  config.action_mailer.smtp_settings = {
  		:address        => 'smtp.gmail.com',
    	:port           => '587',
  	  :authentication => :plain,
  	  :user_name      => ENV['GMAIL_USERNAME'],
  	  :password       => ENV['GMAIL_PASSWORD'],
  	  :domain         => 'gmail.com',
  	  :enable_starttls_auto => true
  	}
	end

	if Rails.env.production?
		config.action_mailer.raise_delivery_errors = false
		config.action_mailer.default_url_options = { host: "electretri.herokuapp.com" }   
  	config.action_mailer.smtp_settings = {
  		:address        => 'smtp.sendgrid.net',
    	:port           => '587',
  	  :authentication => :plain,
  	  :user_name      => ENV['SENDGRID_USERNAME'],
  	  :password       => ENV['SENDGRID_PASSWORD'],
  	  :domain         => 'heroku.com',
  	  :enable_starttls_auto => true
  	}
	end
end