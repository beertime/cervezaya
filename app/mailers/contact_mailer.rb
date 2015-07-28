class ContactMailer < ApplicationMailer

  def business_mail(params)
    @name = params['name']
    @email = params['email']
    @address = params['address']
    @phone = params['phone']
    @products = params['products']
    @comment = params['comment']

    if Rails.env == 'production'
      mail(to: "contacto@cervezaya.com", subject: 'Business')
    else
      mail(to: "davidsingal@icloud.com", subject: 'Business')
    end
  end

  def ios_mail(email)
    @email = email
    if Rails.env == 'production'
      mail(to: "contacto@cervezaya.com", subject: 'iOS Request')
    else
      mail(to: "davidsingal@icloud.com", subject: 'iOS Request')
    end
  end

end
