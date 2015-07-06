class ContactController < ApplicationController

  def bussines_mail
    phone = params[:phone]
    ContactMailer.business_mail(phone).deliver
    redirect_to empresas_y_bares_path, notice: 'Mensaje enviado correctamente'
  end

  def ios_mail
    email = params[:email]
    ContactMailer.business_mail(email).deliver
    redirect_to root_path, notice: 'Mensaje enviado correctamente'
  end

end