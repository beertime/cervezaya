class ContactMailer < ApplicationMailer

  def business_mail(phone)
    @phone = phone
    if Rails.env == 'production'
      mail(to: "contact@cervezaya.com", subject: 'Business')
    else
      mail(to: "davidsingal@icloud.com", subject: 'Business')
    end
  end

end
