class RegistrationsController < ApplicationController
  def new
    @registration = RegistrationForm.new
  end

  def create
    @registration = RegistrationForm.new(registration_params)

    if @registration.submit
      sign_in @registration.registered_user
      redirect_to dashboard_path,
        notice: "Welcome, #{@registration.registered_user.name}"
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration_form).permit(:email, :name, :password)
  end
end
