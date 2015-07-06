class ContactController < ApplicationController
  def send_mail
    phone = params[:phone]
    ContactMailer.business_mail(phone)
    redirect_to empresas_y_bares_path, notice: 'Mensaje enviado correctamente'
  end
end
